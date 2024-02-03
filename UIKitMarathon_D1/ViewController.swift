//
//  ViewController.swift
//  UIKitMarathon_D1
//
//  Created by Maksim Vaselkov on 03.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var gradientView = GradientView()

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.layer.cornerRadius = 20.0
        gradientView.layer.cornerCurve = .continuous

        view.addSubview(gradientView)

        setupConstrains()
    }

    private func setupConstrains() {
        NSLayoutConstraint.activate([
            gradientView.widthAnchor.constraint(equalToConstant: 100),
            gradientView.heightAnchor.constraint(equalToConstant: 100),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class GradientView: UIView {
    private let gradientLayer = CAGradientLayer()

    init() {
        super.init(frame: .zero)

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: 10, height: 10)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4

        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 1)

        layer.addSublayer(gradientLayer)
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)

        if layer == self.layer {
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = layer.cornerRadius
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

