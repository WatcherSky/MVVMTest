//
//  CategoriesTableViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 23.03.2023.
//

import UIKit
import SnapKit

class CategoriesTableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 30, height: 30)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = true
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewIdentifiers.category)
        return collectionView
    }()
    
    private let images = [UIImage.init(named: "phones_image"), UIImage.init(named: "headphones_image"), UIImage.init(named: "games_image"), UIImage.init(named: "cars_image"), UIImage.init(named: "furniture_image"), UIImage.init(named: "kids_image")]
    private let labels = ["Phones", "Headphones", "Games", "Cars", "Furnitures", "Kids"]
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupUI()
    }

}


extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewIdentifiers.category, for: indexPath) as! CategoriesCollectionViewCell
        cell.setupUI()
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2
        cell.imageView.layer.borderWidth = 1
        cell.imageView.layer.borderColor = UIColor.white.cgColor
        cell.imageView.image = images[indexPath.item]
        cell.label.text = labels[indexPath.item]
        return cell
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 30, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}


extension CategoriesTableViewCell {
    func setupUI() {
        contentView.addSubview(collectionView)
               
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
