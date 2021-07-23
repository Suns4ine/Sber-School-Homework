//
//  ViewController.swift
//  Homework 14
//
//  Created by Vyacheslav Pronin on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {

    private let size: CGFloat = 200
    
    private lazy var donutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.textAlignment = .center
        button.title(for: .normal)
        button.setTitle("Нажми", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = size / 4
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(newController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var donutView: DonutView = {
        let view = DonutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        //self.navigationController?.navigationBar.barTintColor = .systemBackground
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        setup()
    }

    private func setup() {
        [donutView].forEach{ view.addSubview($0) }
        view.insertSubview(donutButton, belowSubview: donutView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            donutView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donutView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            donutView.heightAnchor.constraint(equalToConstant: size),
            donutView.widthAnchor.constraint(equalToConstant: size),
            
            donutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            donutButton.heightAnchor.constraint(equalToConstant: size / 2),
            donutButton.widthAnchor.constraint(equalToConstant: size / 2),
        ])
    }
    
    @objc
    private func newController() {
        let controller = SecondViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

