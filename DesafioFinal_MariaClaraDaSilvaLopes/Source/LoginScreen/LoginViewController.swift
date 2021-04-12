import UIKit
import Alamofire

class LoginViewController: UIViewController {
    let customView = LoginView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func makeController(user: User, session: RequestConfig) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController else {return}
        homeViewController.user = user
        homeViewController.requestConfig = session
        homeViewController.modalPresentationStyle = .fullScreen
        self.present(homeViewController, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController.init(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
    func bind() {
        customView.didTapOk = { [weak self] credential in
            var requestConfig = RequestConfig()
            let params: [String: String] = ["email": credential.email, "password": credential.password]
            
            AF.request(requestConfig.postSignIn(), method: .post, parameters: params)
                .responseDecodable(of: User.self) { response in
                    switch response.result {
                    case .success(let user):
                        let headers = response.response?.allHeaderFields
                        guard let accessToken = headers?["access-token"] as? String,
                              let client = headers?["client"] as? String else {
                            self?.showAlert(message: "Desculpe mas não foi possível realizar o login")
                            return
                        }
                        requestConfig.updateRequestConfig(accessToken: accessToken, client: client, uid: user.investor.email)
                        self?.makeController(user: user, session: requestConfig)
                    case .failure:
                        self?.showAlert(message: "Login ou senha incorretos.")
                        self?.customView.loginError()
                        return
                    }
                }
        }
    }
}
