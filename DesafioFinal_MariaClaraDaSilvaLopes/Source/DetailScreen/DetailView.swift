import UIKit
import SnapKit
import Kingfisher

class DetailView: UIView {
    
    let containerView: UIView = UIView()
    
    let logoView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let imageEnterprise: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    let nameEnterprise: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        containerView.addSubview(logoView)
        self.addSubview(containerView)
        logoView.addSubview(imageEnterprise)
        logoView.addSubview(nameEnterprise)
    }
    
    func setConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.left.bottom.right.equalToSuperview()
        }
        
        logoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.centerX.equalToSuperview()
            make.height.equalTo(120)
        }
        
        imageEnterprise.snp.makeConstraints { (make) in
            make.top.equalTo(34)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(52)
        }
        
        nameEnterprise.snp.makeConstraints { (make) in
            make.top.equalTo(imageEnterprise.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
        }
    }
    
    func updateUI(name: String, pathUrl: String) {
        nameEnterprise.text = name
        imageEnterprise.kf.setImage(with: RequestConfig().makeImageURL(imagePath: pathUrl))
    }
}
