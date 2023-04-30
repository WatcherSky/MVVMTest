//
//  LatestCollectionViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 24.03.2023.
//

import UIKit
import Kingfisher

class LatestCollectionViewCell: UICollectionViewCell {
    
    var latest: Latest? {
        didSet{
            if let latestItem = latest {
                labelName.text = latestItem.name
                labelCategory.text = latestItem.category
                labelPrice.text = "$ \(latestItem.price)"
                imageView.kf.setImage(with: latestItem.image_url)
            }
        }
    }
    
    private var containerView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var imageCircle: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "circlePlus_image")
        image.backgroundColor = .white
        image.layer.masksToBounds = false
        image.layer.borderWidth = 1
        return image
    }()
    
    private var labelName: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    private var labelPrice: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var labelCategory: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        label.layer.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85).cgColor
        return label
    }()
}





extension LatestCollectionViewCell {
    
    func setupUI() {
        contentView.addSubview(containerView)
        
        [imageView, labelName, labelPrice, labelCategory, imageCircle].forEach {
            containerView.addSubview($0)
        }
        
        makeConstraint()
    }
    
    
    func makeConstraint() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.right.bottom.left.top.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
        labelName.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.bottom.equalTo(labelPrice.snp.bottom).offset(-10)
        }
        
        labelPrice.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.left.equalTo(20)
            make.width.equalTo(40)
            make.height.equalTo(8)
        }
        
        labelCategory.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(40)
            make.height.equalTo(8)
            make.bottom.equalTo(labelName.snp.top).offset(-10)
        }
        
        imageCircle.snp.makeConstraints { make in
            make.bottom.right.equalTo(-20)
            make.width.height.equalTo(25)
        }
    }
}
