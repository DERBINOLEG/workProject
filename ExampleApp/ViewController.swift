//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    private let textLabel = UILabel()
    private let imageView = UIImageView()
    private let imageContainerView: UIView = {
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 5, height: -7)
        $0.layer.shadowColor = UIColor.red.cgColor
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        setupLabel()
        view.addSubview(textLabel)
        view.addSubview(imageContainerView)
        imageContainerView.addSubview(imageView)
        setupView()
        setupLayout()
        setupImageView()
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
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
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
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor)
        ])
    }
}

#Preview {
    ViewController()
}

