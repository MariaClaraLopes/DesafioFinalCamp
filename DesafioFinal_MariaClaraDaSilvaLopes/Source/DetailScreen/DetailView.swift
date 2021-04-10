import UIKit

class DetailView: UIView {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ImageLogoHome")
        return image
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
        self.addSubview(logoImageView)
    }

    func setConstraints() {
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.centerX.equalToSuperview()
            make.height.equalTo(120)
        }
    }
}
