//
//  WelcomeView.swift
//  Nearby
//
//  Created by Dyan silva on 12/10/24.
//

import UIKit

class WelcomeView: UIView {
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logoIcon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas vindas ao Nearby!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = Typography.titleXL
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        label.font = Typography.textMD
        label.textColor = Colors.gray500
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let subTextForTips: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Veja como funciona:"
        label.font = Typography.textMD
        label.textColor = Colors.gray500
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let tipsStacksView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let startButton: UIButton = {
        let buttom = UIButton(type: .system)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setTitle("Começar", for: .normal)
        buttom.backgroundColor = Colors.greenBase
        buttom.titleLabel?.font = Typography.action
        buttom.setTitleColor(Colors.gray100, for: .normal)
        buttom.layer.cornerRadius = 8
        return buttom
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subTextForTips)
        addSubview(tipsStacksView)
        addSubview(startButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            subTextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subTextForTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            tipsStacksView.topAnchor.constraint(equalTo: subTextForTips.bottomAnchor, constant: 24),
            tipsStacksView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStacksView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTips() {
        guard let icon = UIImage(named: "mapIcon") else { return }
        let tip = TipsView(icon: icon,
                           title: "Encontre estabelecimentos",
                           description: "Veja locais perto de você que são parceiros Nearby")
        
        let tip1 = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(),
                           title: "Ative o cupom com QR Code",
                           description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let tip2 = TipsView(icon: UIImage(named: "ticket") ?? UIImage(),
                            title: "Garanta vantagens perto de você",
                            description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento")
        
        
        tipsStacksView.addArrangedSubview(tip)
        tipsStacksView.addArrangedSubview(tip1)
        tipsStacksView.addArrangedSubview(tip2)
    }
}
