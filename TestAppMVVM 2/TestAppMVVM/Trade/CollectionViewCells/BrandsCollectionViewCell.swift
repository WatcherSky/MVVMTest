//
//  BrandsCollectionViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 24.03.2023.
//

import UIKit
import Kingfisher

class BrandsCollectionViewCell: UICollectionViewCell {
    
    var latest: Latest? {
        didSet{
            if let latestItem = latest {
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
}





extension BrandsCollectionViewCell {
    
    func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        
        makeConstraint()
    }
    
    
    func makeConstraint() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.height.equalToSuperview()
        }
        
    }
}
