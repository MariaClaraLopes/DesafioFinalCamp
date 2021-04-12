import UIKit
import SnapKit
import Kingfisher

protocol HomeTableViewDelegate {
    func presentNewDetail(enterprise: Enterprise, mainColor: UIColor)
}

class HomeTableView: UIView {
    
    var delegate: HomeTableViewDelegate?
    let customView = DetailViewController()
    let staticUrl = "https://empresas.ioasys.com.br/api/v1"
    var data: EnterpriseModel?
    let colors = [
        UIColor(red: 0.475, green: 0.735, blue: 0.792, alpha: 1),
        UIColor(red: 0.921, green: 0.591, blue: 0.591, alpha: 1),
        UIColor(red: 0.566, green: 0.733, blue: 0.507, alpha: 1)
    ]
    
    let viewLabel: UIView = {
        let view = UIView()
        return view
    }()
    
    let labelResultFail: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        label.font = UIFont(name: "Rubik-Light", size: 14)
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        tableView.separatorColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        viewLabel.isHidden = true
        self.addSubview(tableView)
        tableView.rowHeight = 142
        self.addSubview(viewLabel)
        viewLabel.addSubview(labelResultFail)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        viewLabel.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        labelResultFail.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(63)
            make.right.equalToSuperview().offset(-63)
            make.height.equalTo(24)
        }
    }
    
    func updateLabel() {
        if data == nil {
            viewLabel.isHidden = false
            tableView.isHidden = true
            labelResultFail.text = "Nenhum resultado encontrado"
        } else {
            viewLabel.isHidden = true
            tableView.isHidden = false
        }
    }
    
    func show() -> Int {
        guard let count = data?.enterprises.count else {return 0}
        return count
    }
}

extension HomeTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = data?.enterprises.count else {return 0}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell, let safeData = data else { return UITableViewCell() }
        let pathImage = safeData.enterprises[indexPath.row].photo
        let indexColor = indexPath.row % 3
        cell.contentView.backgroundColor = colors[indexColor]
        cell.nameCompany.text = safeData.enterprises[indexPath.row].enterprise_name
        cell.imageCompany.kf.setImage(with: RequestConfig().makeImageURL(imagePath: pathImage))
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeTableView: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt: IndexPath) {
        guard let safeData = data else {return}
        let enterprise = safeData.enterprises[didSelectRowAt.row]
        let indexColor = didSelectRowAt.row % 3
        delegate?.presentNewDetail(enterprise: enterprise, mainColor: colors[indexColor])
    }
}
