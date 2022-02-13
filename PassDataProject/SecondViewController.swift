//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Кристина Максимова on 11.01.2022.
//

import UIKit

class SecondViewController: UIViewController {
    var greetings = UILabel()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(greetings)
        view.addSubview(button)
        layout()
    }
    
    func layout() {
        greetings.translatesAutoresizingMaskIntoConstraints = false
        greetings.font = .systemFont(ofSize: 35, weight: .light)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go back", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        
        NSLayoutConstraint.activate([
            greetings.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            greetings.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
            button.topAnchor.constraint(equalTo: greetings.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        button.addTarget(.none, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func goBack(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
