import UIKit
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    let customView = HomeView()
    let customTable = HomeTableView()
    let customDetail = DetailView()
    
    var user: User?
    var requestConfig: RequestConfig?
    
    let labelResultSucess: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        label.font = UIFont(name: "Rubik-Light", size: 14)
        return label
    }()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTable.delegate = self
        setupView()
        setConstraints()
        makeRequest()
    }
    
    private func setupView() {
        customView.addSubview(labelResultSucess)
        customView.addSubview(customTable)
    }
    
    private func updateLabel() {
        if customTable.show() == 0 {
            labelResultSucess.isHidden = true
        } else if customTable.show() == 1 {
            labelResultSucess.isHidden = false
            labelResultSucess.text = "\(customTable.show()) resultado encontrado"
        }
        else {
            labelResultSucess.isHidden = false
            labelResultSucess.text = "\(customTable.show()) resultados encontrados"
        }
    }
    
    private func setConstraints() {
        
        labelResultSucess.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(customView.searchBarHome.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(24)
        }
        
        customTable.snp.makeConstraints { (make) in
            make.top.equalTo(labelResultSucess.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func makeRequest() {
        
        //        let params: [String: String] = ["name": "toad"]
        guard let url = requestConfig?.getEnterprises(), let headers = requestConfig?.makeHeaders() else {return}
        
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: EnterpriseModel.self) { [weak self] (response) in
            switch response.result {
            case .success(let enterprise):
                self?.customTable.data = enterprise
                self?.updateLabel()
                self?.customTable.updateLabel()
                self?.customTable.tableView.reloadData()
            case .failure:
                return
            }
        }
    }
}

extension HomeViewController: HomeTableViewDelegate {
    func presentNewDetail(enterprise: Enterprise, mainColor: UIColor) {
        let detailVC = DetailViewController()
        detailVC.mainColor = mainColor
        detailVC.getEnterprise(enterprise: enterprise)
        let nav = UINavigationController(rootViewController: detailVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
