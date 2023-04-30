//
//  ProfileViewController.swift
//  TestAppMVVM
//
//  Created by Владимир on 22.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    let numberOfRows = 7
    
    var coordinator: ProfileFlow?
    
    private var viewModel = ProfileViewModel()
    
    
    private var profileView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "profilePhoto_image")
        return image
    }()
    
    private var changePhotoButton: UIButton = {
        var changePhotoButton = UIButton()
        changePhotoButton.setTitle("Change Photo", for: .normal)
        changePhotoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)
        changePhotoButton.titleLabel?.textAlignment = .center
        changePhotoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        changePhotoButton.setTitleColor(UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1), for: .normal)
        return changePhotoButton
    }()

    private var profileName: UILabel = {
        let label = UILabel()
        label.text = "Online Shop Satria Adhi Pradana"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.layer.backgroundColor = UIColor(red: 0.086, green: 0.094, blue: 0.149, alpha: 1).cgColor
        
        return label
    }()
    
    private var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload Item", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.backgroundColor = UIColor(red: 0.306, green: 0.333, blue: 0.843, alpha: 1).cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profile")
        tableView.backgroundColor = .white
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! ProfileTableViewCell
        cell.setupUI(height: tableView.frame.height / 7)

        let type = SectionType(rawValue: indexPath.row)
        switch type {
        case .tradeStore:
            cell.accessoryType = .disclosureIndicator
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            return cell
        case .paymentMethod:
            cell.accessoryType = .disclosureIndicator
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            return cell
        case .balance:
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            cell.rightText.text = "$ 1593"
            return cell
        case .tradeHistory:
            cell.accessoryType = .disclosureIndicator
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            return cell
        case .restorePurchase:
            cell.accessoryType = .disclosureIndicator
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            return cell
        case .help:
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            cell.image.layer.cornerRadius = 15
            cell.image.layer.borderWidth = 1
            cell.image.layer.borderColor = UIColor.black.cgColor
            cell.image.clipsToBounds = true
            return cell
        case .logout:
            cell.title.text = viewModel.sections[indexPath.row].title
            cell.image.image = viewModel.sections[indexPath.row].image
            return cell
        case .none:
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = SectionType(rawValue: indexPath.row)
        switch type {
        case .logout:
            coordinator?.coordinateToSignIn()
        default:
            return
        }
    }
}


extension ProfileViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Profile"
        
        [tableView, profileView, uploadButton, changePhotoButton, profileName].forEach {
            view.addSubview($0)
        }
        makeConstraints()
    }
    
    
    func makeConstraints() {
        
        profileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.center.x);
            make.width.height.equalTo(60)
        }
        
        changePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(8)
            make.centerX.equalTo(view.center.x);
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        
        profileName.snp.makeConstraints { make in
            make.top.equalTo(changePhotoButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x);
            make.width.equalTo(200)
            make.height.equalTo(15)
        }
        
        uploadButton.snp.makeConstraints { make in
            make.top.equalTo(profileName.snp.bottom).offset(5)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(40)
        }
    
        tableView.snp.makeConstraints { make in
            make.top.equalTo(uploadButton.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
