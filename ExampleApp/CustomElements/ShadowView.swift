//
//  ShadowView.swift
//  ExampleApp
//
//  Created by Олег Дербин on 08.10.2024.
//

import UIKit

class ShadowView: UIView {
    private let imageView = UIImageView()
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupView()
        setupImageView(imageName)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
    
    private func setupImageView(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
    
    func updateImage(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
