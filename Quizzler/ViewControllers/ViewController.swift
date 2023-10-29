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
        element.progressTintColor = UIColor(red: 1.00, green: 0.46, blue: 0.66, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let firstButton = UIButton(buttonText: "1")
    private let secondButton = UIButton(buttonText: "2")
    private let thirdButton = UIButton(buttonText: "3")
    
    // MARK: - Private Properties
    
    private var quizBrain = QuizBrain()
    private var delayTime = 0.3
    
    private var timer = Timer()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        updateUI()
    }
    
    // MARK: - Private Methods
    
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
        
        firstButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        firstButton.layer.cornerRadius = 20
        secondButton.layer.cornerRadius = 20
        thirdButton.layer.cornerRadius = 20


    }
    
    @objc private func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {
            print("CurrentTitle Error")
            return
        }
        
        let check = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = check ? .green : .red
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: delayTime, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc private func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText
        progressBar.setProgress(quizBrain.progress, animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstButton.setTitle(quizBrain.getAnswer()[0], for: .normal)
        secondButton.setTitle(quizBrain.getAnswer()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getAnswer()[2], for: .normal)
        
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear
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


