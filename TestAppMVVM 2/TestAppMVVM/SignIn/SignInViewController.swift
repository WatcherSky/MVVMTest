//
//  ViewController.swift
//  TestAppMVVM
//
//  Created by Владимир on 16.03.2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    var coordinator: SignInFlow?
    private var viewModel: SignInViewModel
    
    private var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.layer.backgroundColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1).cgColor
        
        return label
    }()
    
    private var firstNameField: UITextField = {
        let firstName = UITextField()
        firstName.backgroundColor = .white
        firstName.layer.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        firstName.layer.borderWidth = 1
        firstName.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        firstName.placeholder = "FirstName"
        firstName.textAlignment = .center
        firstName.layer.cornerRadius = 15
        firstName.autocorrectionType = .no
        
        return firstName
    }()
    
    private var lastNameField: UITextField = {
        let lastName = UITextField()
        lastName.backgroundColor = .white
        lastName.layer.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        lastName.layer.borderWidth = 1
        lastName.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        lastName.placeholder = "Last Name"
        lastName.textAlignment = .center
        lastName.layer.cornerRadius = 15
        lastName.autocorrectionType = .no
        return lastName
    }()
    
    private var emailField: UITextField = {
        let email = UITextField()
        email.backgroundColor = .white
        email.layer.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        email.layer.borderWidth = 1
        email.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        email.placeholder = "Email"
        email.textAlignment = .center
        email.layer.cornerRadius = 15
        email.autocorrectionType = .no
        return email
    }()
    
    private var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.layer.backgroundColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1).cgColor
        return label
    }()
    
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.addTarget(.none, action: #selector(loginAction), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 0.145, green: 0.31, blue: 0.902, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.addTarget(.none, action: #selector(signInAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1).cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    
    private var googleImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.image = UIImage.init(named: "google_image")
        image.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        return image
    }()
    
    var appleImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.image = UIImage.init(named: "apple_image")
        image.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        return image
    }()
    
    private var googleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with Google"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var appleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with Apple"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    @objc private func loginAction() {
        coordinator?.coordinateToLogin()
    }
    
    @objc private func signInAction() {
        let name = firstNameField.text
        let password = lastNameField.text
        let email = emailField.text
        
        
        if let email = email {
            if email.isEmpty {
                alert(title: "Error", message: "Email Is Empty")
                return
            }
            
            let isValidEmail = viewModel.isValidEmail(email: email)
            if !isValidEmail {
                alert(title: "Error", message: "invalid email")
                return
            }
            
        }
        
        if let name = name, let password = password {
            if name.isEmpty || password.isEmpty {
                alert(title: "Error", message: "Empty Field")
                return
            }
            
            let isSaved = viewModel.createItem(name: name, password: name)
            isSaved ? coordinator?.coordinateToTabBar() :  alert(title: "Error", message: "User Exist")
        }
    }
}


// MARK: - UI
extension SignInViewController {
    fileprivate func configUI() {
        view.backgroundColor = .white
        
        [loginButton, signInLabel, firstNameField, lastNameField, emailField,accountLabel, appleLabel, googleLabel, appleImage, googleImage, signInButton].forEach {
            view.addSubview($0)
        }
        
        signInLabel.snp.makeConstraints { m in
            m.top.equalTo(155.93)
            m.left.equalTo(142)
            m.right.equalTo(-142)
            m.height.equalTo(25)
        }
        
        firstNameField.snp.makeConstraints { m in
            m.top.equalTo(signInLabel.snp.bottom).offset(77)
            m.left.equalToSuperview().offset(40)
            m.right.equalToSuperview().offset(-40)
            m.height.equalTo(29)
        }
        
        lastNameField.snp.makeConstraints { m in
            m.top.equalTo(firstNameField.snp.bottom).offset(35)
            m.left.equalToSuperview().offset(40)
            m.right.equalToSuperview().offset(-40)
            m.height.equalTo(29)
        }
        
        emailField.snp.makeConstraints { m in
            m.top.equalTo(lastNameField.snp.bottom).offset(35)
            m.left.equalToSuperview().offset(40)
            m.right.equalToSuperview().offset(-40)
            m.height.equalTo(29)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(35)
            make.left.equalTo(43)
            make.right.equalTo(-43)
            make.height.equalTo(46)
        }
        
        
        loginButton.snp.makeConstraints { m in
            m.top.equalTo(signInButton.snp.bottom).offset(17)
            m.left.equalTo(accountLabel.snp.right).offset(8)
            m.width.equalTo(29)
            m.height.equalTo(9.5)
        }
        
        accountLabel.snp.makeConstraints { m in
            m.top.equalTo(signInButton.snp.bottom).offset(17)
            m.left.equalTo(42)
            m.width.equalTo(122.9)
            m.height.equalTo(9.42)
        }
        
        
        googleLabel.snp.makeConstraints { make in
            make.top.equalTo(googleImage.snp.top).offset(5)
            make.left.equalTo(googleImage.snp.right).offset(11)
            make.height.equalTo(11)
            make.right.equalToSuperview().offset(127)
        }
        
        googleImage.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(82.9)
            make.left.equalTo(99)
            make.width.equalTo(23)
            make.height.equalTo(24)
            
        }
        
        appleLabel.snp.makeConstraints { make in
            make.top.equalTo(googleImage.snp.bottom).offset(44)
            make.left.equalTo(appleImage.snp.right).offset(14)
            make.height.equalTo(11)
            make.right.equalToSuperview().offset(138)
        }
        
        appleImage.snp.makeConstraints { make in
            make.top.equalTo(googleImage.snp.bottom).offset(38)
            make.left.equalTo(99)
            make.width.equalTo(18)
            make.height.equalTo(21)
        }
    }
}

