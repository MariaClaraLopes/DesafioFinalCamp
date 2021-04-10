import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
        
    let imageCompany: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "AppIcon")
        return image
    }()
    
    let nameCompany: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupView() {
        contentView.addSubview(imageCompany)
        contentView.addSubview(nameCompany)
    }
    
    func setConstraints() {
        imageCompany.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        
        nameCompany.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(22)
        }
    }
}
