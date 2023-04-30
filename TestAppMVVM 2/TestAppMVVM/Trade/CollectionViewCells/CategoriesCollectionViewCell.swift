//
//  CategoriesCollectionViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 24.03.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let image = UIImageView()

        return image
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    func setupUI() {
        
        
        [imageView, label].forEach {
            contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.width.height.equalTo(30)
            make.centerY.equalTo(contentView.center.y)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.equalTo(10)
            make.width.equalTo(imageView.snp.width)
            make.height.equalTo(8)
            
        }
    }
}
