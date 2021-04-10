import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let customView = HomeView()
    let customTable = HomeTableView()
    let customDetail = DetailView()
    
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
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        customView.addSubview(labelResultSucess)
        customView.addSubview(customTable)
        updateLabel()
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
}
