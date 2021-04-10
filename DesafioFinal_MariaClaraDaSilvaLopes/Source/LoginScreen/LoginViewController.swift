import UIKit

class LoginViewController: UIViewController {
    let customView = LoginView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
        customView.didTapOk = { [weak self] button in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController else {return}
            homeViewController.modalPresentationStyle = .fullScreen
            self?.present(homeViewController, animated: true)
        }
    }
}

