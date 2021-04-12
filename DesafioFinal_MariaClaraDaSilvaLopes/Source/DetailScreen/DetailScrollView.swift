import UIKit

class DetailScrollView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.indicatorStyle = .white
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let wrapperView = UIView()
    
    let containerView = UIView()
    
    let contentBox: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Rubik-Light", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = self.bounds
    }
    
    func setupView() {
        self.addSubview(scrollView)
        scrollView.addSubview(wrapperView)
        wrapperView.addSubview(containerView)
        containerView.addSubview(contentBox)
        contentBox.addArrangedSubview(textLabel)
    }
    
    func setupConstraints() {
        
        wrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(374)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentBox.snp.makeConstraints { make in
            make.left.top.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalToSuperview().inset(44)
        }
        
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func updateEntepriseDescription(description: String) {
        self.textLabel.text = description
    }
}

