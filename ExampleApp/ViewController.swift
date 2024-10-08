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
    private let shadowView = ShadowView(imageName: "raccoon")
    private let secondShadowView = ShadowView(imageName: "custom")
    
    private let helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        setupLabel()
        setupStackView()
        view.addSubview(stackView)
        setupView()
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .red
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        // Добавляем подслой к супервью
        view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
}

#Preview {
    ViewController()
}

