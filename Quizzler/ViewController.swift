//
//  ViewController.swift
//  Quizzler
//
//  Created by Сазонов Станислав on 28.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 10
        element.distribution = .fillProportionally
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var scoreLabel: UILabel = {
        let element = UILabel()
        element.textColor = .white
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 20)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var questionLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 30, weight: .bold)
        element.textColor = .white
        element.numberOfLines = .zero
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Background-Bubbles")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var answersStackView: UIStackView = {
        let element = UIStackView()
        element.spacing = 10
        element.distribution = .fillEqually
        element.axis = .vertical
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var progressBar: UIProgressView = {
        let element = UIProgressView()
        element.progress = 0.5
        element.progressTintColor = UIColor(red: 1.00, green: 0.46, blue: 0.66, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let firstButton = UIButton(buttonText: "1")
    private let secondButton = UIButton(buttonText: "2")
    private let thirdButton = UIButton(buttonText: "3")
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
}

extension ViewController {
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.15, green: 0.17, blue: 0.29, alpha: 1)
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(scoreLabel)
        mainStackView.addArrangedSubview(questionLabel)
        mainStackView.addArrangedSubview(answersStackView)
        
        answersStackView.addArrangedSubview(firstButton)
        answersStackView.addArrangedSubview(secondButton)
        answersStackView.addArrangedSubview(thirdButton)
        
        mainStackView.addArrangedSubview(progressBar)
        
        scoreLabel.text = "Score: "
        questionLabel.text = "Which is the largest organ in the human body?"
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 102),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            thirdButton.heightAnchor.constraint(equalToConstant: 80),
            
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            
        ])
    }
}

extension UIButton {
    convenience init(buttonText: String) {
        self.init(type: .system)
        
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.tintColor = .white
        self.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25)
        self.setTitle(buttonText, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

