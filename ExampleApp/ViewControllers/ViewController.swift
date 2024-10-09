//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    private let shadowView = ShadowView(imageName: ShadowViewType.raccoon.rawValue)
    private let numberButton = CustomButton(textButton: "Change number", bgColor: .systemRed)
    private let imageButton = CustomButton(textButton: "Change image", bgColor: .systemGreen)
    
    
    private let helper = Helper()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        view.addGradient()
        
        setupLabel()
        setupStackView()
        view.addSubview(stackView)
        addAction()
        
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
    }
    
    @objc
    private func numberButtonTapped() {
        textLabel.text = helper.getRandomNumber().formatted()
    }
    
}

//MARK: - Nested Types
extension ViewController {
    
    enum ShadowViewType: String {
        case raccoon = "raccoon"
        case custom = "custom"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}

//MARK: - Setup View
private extension ViewController {
    func addAction() {
        numberButton.addTarget(
            self,
            action: #selector(
                numberButtonTapped
            ),
            for: .touchUpInside
        )
        
        let action = UIAction { _ in
            let randomImageName = [
                ShadowViewType.raccoon,
                ShadowViewType.custom
            ].randomElement() ?? ShadowViewType.raccoon
            self.shadowView.updateImage(randomImageName.rawValue)
        }
        imageButton.addAction(action, for: .touchUpInside)
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
    }
    
    func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textLabel.textColor = .red
        textLabel.textAlignment = .center
    }
    
}


//MARK: - Setup Layout
extension ViewController {
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}

#Preview {
    ViewController()
}

