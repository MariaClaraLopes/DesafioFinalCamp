import UIKit

class DetailViewController: UIViewController {
    let customView = DetailView()
    let customScroll = DetailScrollView()
    let empresaTeste =  "Ioasys"
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Empresa \(empresaTeste)"
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        let image = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem.init(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
        backButton.tintColor = UIColor(red: 0.88, green: 0.119, blue: 0.411, alpha: 1)
        navigationItem.leftBarButtonItem = backButton
        customView.addSubview(customScroll)
    }

    
    @objc func goBack(){
        //self.dismiss(animated: true, completion: nil)
        print("VOLTEI")
    }
    
    private func setConstraints() {
        
        customScroll.snp.makeConstraints { (make) in
            make.top.equalTo(customView.logoImageView.snp.bottom).offset(24)
            make.left.right.bottom.width.equalToSuperview()
        }
    }
}
