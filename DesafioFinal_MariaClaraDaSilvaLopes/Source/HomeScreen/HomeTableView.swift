import UIKit
import SnapKit

class HomeTableView: UIView {
    let data: [Int] = [1,2,3]
    
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
        setupView()
        setConstraints()
        updateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = self.bounds
    }
    
    private func setupView() {
        viewLabel.isHidden = true
        self.addSubview(tableView)
        tableView.rowHeight = 100
        self.addSubview(viewLabel)
        viewLabel.addSubview(labelResultFail)
    }
    
    private func setConstraints() {
    
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
    
    private func updateLabel() {
        if data.isEmpty {
            viewLabel.isHidden = false
            tableView.isHidden = true
            labelResultFail.text = "Nenhum resultado encontrado"
        }
    }
    
    func show() -> Int {
        return data.count
    }
}

extension HomeTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
        cell.nameCompany.text = String(data[indexPath.row])

//        cell.textLabel?.text = "Assistência: \(indexPath.row+1)"
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
//        cell.imageView?.image = UIImage(systemName: "swift")
//        cell.imageView?.tintColor = .darkGray
        return cell
    }
}

//extension TableView: UITableViewDelegate {
//    func tableView(_: UITableView, didSelectRowAt: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
//        detailViewController.modalPresentationStyle = .fullScreen
//    }
//}


