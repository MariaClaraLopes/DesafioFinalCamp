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
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "      O iOS foi desenvolvido especificamente para dispositivos touchscreen, sendo o primeiro a introduzir o uso dos dedos para gerir a interface, dispensando o uso de canetas. A interação direta com a tela possibilitou a criação de gestos como a pinça, para dar zoom ou diminuir a exibição de conteúdos na tela. Desde então, o sistema já passou por diversas mudanças.As atualizações maiores e mais pesadas do iOS (iOS 11, iOS 12, iOS 13,...) são feitas anualmente. Já as versões menores, normalmente com funções simples e solução de bugs (iOS 13.1, iOS 13.1.2,...) não têm um momento determinado para acontecer, sendo lançadas na medida em que a empresa identifica a necessidade de correções e melhorias para otimizar o desempenho. O iOS já vem com um conjunto de apps nativos da Apple, entre os quais estão Música, Podcasts, TV, Mapas, Notas, Contatos, Livros, Safari, além da assistente de voz Siri e do serviço de nuvem iCloud. A segurança é outra característica enfatizada pela Apple, que busca manter um rígido controle de qualidade em relação aos aplicativos enviados à App Store. Assim, as chances de instalação de aplicativos nocivos tendem a ser mais baixas.Mesmo as versões recentes do sistema conservam os pilares originais do iOS, que são: design minimalista, facilidade de mexer e a experiência de uso padronizada. Ou seja, todos os aparelhos com o iOS possuem a mesma interface, e os usuários sabem exatamente o que esperar. Diferentemente do Android, o iOS não permite muitas personalizações, evitando que ocorram problemas e divergências nos aplicativos em cada aparelho. A Apple vem avançando em relação aos recursos e buscando otimizar o funcionamento do sistema, sobretudo em relação às exigências dos usuários."
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
}

