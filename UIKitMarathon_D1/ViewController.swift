//
//  ViewController.swift
//  UIKitMarathon_D1
//
//  Created by Maksim Vaselkov on 03.02.2024.
//

import UIKit

class ViewController: UIViewController {

    enum Const {
        static let hundredPt: CGFloat = 100.0
        static let cornerRadius = 20.0
    }

    private var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 1)
        gradientLayer.cornerRadius = Const.cornerRadius
        return gradientLayer
    }()

    private var gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .init(width: 10, height: 10)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientView.layer.addSublayer(gradientLayer)
        view.addSubview(gradientView)

        setupConstrains()
    }

    override func viewDidLayoutSubviews() {
        gradientLayer.frame = gradientView.bounds
    }


    private func setupConstrains() {
        NSLayoutConstraint.activate([
            gradientView.widthAnchor.constraint(equalToConstant: Const.hundredPt),
            gradientView.heightAnchor.constraint(equalToConstant: Const.hundredPt),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Const.hundredPt),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

