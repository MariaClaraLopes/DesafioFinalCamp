import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    let imageCompany: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    let nameCompany: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
        contentView.layer.cornerRadius = 5
        contentView.addSubview(imageCompany)
        contentView.addSubview(nameCompany)
    }
    
    func setConstraints() {
        imageCompany.snp.makeConstraints { (make) in
            make.top.equalTo(34)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(52)
        }
        
        nameCompany.snp.makeConstraints { (make) in
            make.top.equalTo(imageCompany.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16))
    }
}
