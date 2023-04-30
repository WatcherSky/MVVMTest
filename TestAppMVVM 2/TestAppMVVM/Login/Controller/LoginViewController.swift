//
//  LoginViewController.swift
//  TestAppMVVM
//
//  Created by Владимир on 21.03.2023.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {

    var coordinator: LoginFlow?
    var viewModel: LoginViewModel
    //MARK: - Properties
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.layer.backgroundColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1).cgColor
        
        return label
    }()
    
    
    var firstNameField: UITextField = {
        let firstName = UITextField()
        firstName.backgroundColor = .white
        firstName.layer.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        firstName.layer.borderWidth = 1
        firstName.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        firstName.placeholder = "First Name"
        firstName.textAlignment = .center
        firstName.layer.cornerRadius = 15
        firstName.autocorrectionType = .no
        return firstName
    }()
        
    var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "eye_image"), for: .normal)
        button.addTarget(self, action: #selector(eyeAction), for: .touchUpInside)
        return button
    }()
    
    var passwordField: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white
        password.layer.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        password.layer.borderWidth = 1
        password.rightViewMode = .always
        password.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        password.placeholder = "Password"
        password.textAlignment = .center
        password.layer.cornerRadius = 15
        password.isSecureTextEntry = true
        password.autocorrectionType = .no
        return password
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(.none, action: #selector(loginAction), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1).cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    //MARK: - Init
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    @objc private func eyeAction() {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
        passwordField.isSecureTextEntry ? eyeButton.setImage(UIImage.init(named: "eye_image"), for: .normal) : eyeButton.setImage(UIImage.init(named: "eyeOpen_image"), for: .normal)
    }
    
    @objc private func loginAction() {
        let name = firstNameField.text
        let password = passwordField.text
        
        if let name = name, let password = password {
            if name.isEmpty || password.isEmpty {
                alert(title: "Error", message: "Empty Field")
                return
            }
            
            let isExistUser = viewModel.validateUser(name: name, password: password)
            isExistUser ? coordinator?.coordinateToTabBar() :  alert(title: "Error", message: "Email Or password aren't is incorrect")
        }
    }
}

    //MARK: - SetupUI
extension LoginViewController {
    func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        
        [firstNameField, passwordField, welcomeLabel, eyeButton, loginButton].forEach {
            view.addSubview($0)
        }
    
        welcomeLabel.snp.makeConstraints { m in
            m.top.equalTo(158)
            m.left.equalTo(90)
            m.right.equalTo(-90)
            m.height.equalTo(20)
        }
        
        firstNameField.snp.makeConstraints { m in
            m.top.equalTo(welcomeLabel.snp.bottom).offset(35)
            m.left.equalToSuperview().offset(40)
            m.right.equalToSuperview().offset(-40)
            m.height.equalTo(29)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(firstNameField.snp.bottom).offset(35)
            make.left.equalTo(43)
            make.right.equalTo(-43)
            make.height.equalTo(29)
        }
                
        eyeButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.top).offset(8)
            make.right.equalTo(passwordField.snp.right).offset(-10)
            make.height.width.equalTo(15)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(200)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(46)
        }
    }
}
