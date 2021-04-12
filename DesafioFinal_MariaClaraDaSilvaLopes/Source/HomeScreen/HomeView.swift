import UIKit

class HomeView: UIView {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ImageLogoHome")
        return image
    }()
    
    let searchBarHome: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Pesquise por empresa"
        search.layer.cornerRadius = 4
        search.keyboardType = .alphabet        
        search.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        return search
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
        searchBarHome.addTarget(self, action: #selector(textFieldDidChangeSelection), for: .editingChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        let tapReturn = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        self.addGestureRecognizer(tapReturn)
        tapReturn.cancelsTouchesInView = false
        self.addSubview(logoImageView)
        self.addSubview(searchBarHome)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func setConstraints() {
        logoImageView.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.width.equalTo(375)
            make.height.equalTo(188)
        }
        
        searchBarHome.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(164)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            
        }
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("SDJLS;AJDLKSAHKJLASHFLKA")
    }
}
