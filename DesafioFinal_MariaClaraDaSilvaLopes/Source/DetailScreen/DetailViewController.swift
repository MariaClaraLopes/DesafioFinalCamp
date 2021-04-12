import UIKit
import Alamofire
import SnapKit

class DetailViewController: UIViewController {
    let customView = DetailView()
    let customScroll = DetailScrollView()
    
    var enterprise: Enterprise?
    var requestConfig: RequestConfig?
    var mainColor: UIColor = .white
    
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let titleEnterprise = enterprise?.enterprise_name else {return}
        self.title = "Empresa \(titleEnterprise)"
        customView.logoView.backgroundColor = mainColor
        setupView()
        setConstraints()
        
        guard let safeEnterprise = enterprise else {return}
        print(safeEnterprise)
    }
    
    private func setupView() {
        let image = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
        backButton.tintColor = UIColor(red: 0.88, green: 0.119, blue: 0.411, alpha: 1)
        navigationItem.leftBarButtonItem = backButton
        customView.containerView.addSubview(customScroll)
        
        guard let safeEnterprise = enterprise else {return}
        customScroll.updateEntepriseDescription(description: safeEnterprise.description)
        customView.updateUI(name: safeEnterprise.enterprise_name, pathUrl: safeEnterprise.photo)
    }
    
    func getEnterprise(enterprise: Enterprise) {
        self.enterprise = enterprise
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
        print("VOLTEI")
    }
    
    private func setConstraints() {
        customScroll.snp.makeConstraints { (make) in
            make.top.equalTo(customView.logoView.snp.bottom).offset(24)
            make.left.right.bottom.width.equalToSuperview()
        }
    }
}
