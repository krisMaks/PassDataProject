//
//  ViewController.swift
//  PassDataProject
//
//  Created by Кристина Максимова on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var login: UITextField = {
        let loginTF = UITextField()
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.placeholder = "Login"
        loginTF.borderStyle = .roundedRect
        return loginTF
    }()
    private lazy var password: UITextField = {
        let passwordTF = UITextField()
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.placeholder = "Password"
        passwordTF.borderStyle = .roundedRect
        passwordTF.isSecureTextEntry = true
        return passwordTF
    }()
    private lazy var result: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "Greetings"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    private lazy var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Pass Data Project"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 35, weight: .light)
        return nameLabel
    }()
    private lazy var button: UIButton = {
        let buttonIn = UIButton()
        buttonIn.setTitle("Login", for: .normal)
        buttonIn.backgroundColor = .white
        buttonIn.setTitleColor(.black, for: .normal)
        buttonIn.translatesAutoresizingMaskIntoConstraints = false
        return buttonIn
    }()
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
        setupConstraints()
        NSLayoutConstraint.activate(sharedConstraints)
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
        buttonAction()
    }
    
    func setupUI() {
        view.addSubview(login)
        view.addSubview(password)
        view.addSubview(result)
        view.addSubview(name)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            login.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30),
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: login.widthAnchor),
            
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            result.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            result.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        compactConstraints.append(contentsOf: [
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20)
        ])
        regularConstraints.append(contentsOf: [
            login.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 50),
            login.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
            password.widthAnchor.constraint(lessThanOrEqualToConstant: 400)
        ])
    }
    
    func layoutTrait(traitCollection:UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
           NSLayoutConstraint.activate(sharedConstraints)
        }
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutTrait(traitCollection: traitCollection)
    }
    
    func buttonAction() {
        button.addTarget(self, action: #selector(goInSecondViewController), for: .touchUpInside)
    }
    
    @objc func goInSecondViewController() {
        let svc = SecondViewController()
        
        self.present(svc, animated: true) {
            svc.greetings.text = self.login.text
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}

