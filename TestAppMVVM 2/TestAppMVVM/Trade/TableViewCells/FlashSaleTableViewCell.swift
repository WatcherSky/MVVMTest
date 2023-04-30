//
//  FlashSaleTableViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 23.03.2023.
//

import UIKit


class FlashSaleTableViewCell: UITableViewCell {
    var flashSale = [FlashSale]() {
        didSet {
            collectionView.reloadData()
        }
    }

    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewIdentifiers.flashSale)
        return collectionView
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



extension FlashSaleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flashSale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewIdentifiers.flashSale, for: indexPath) as! FlashSaleCollectionViewCell
        cell.flashSale = flashSale[indexPath.item]
        cell.setupUI()
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        
        cell.imageProfile.layer.cornerRadius = 12.5
        cell.imageProfile.clipsToBounds = true
        
        cell.imageFavourite.layer.cornerRadius = 12.5

        cell.imageCircle.layer.cornerRadius = 17.5
        cell.imageCircle.clipsToBounds = true
        
        cell.labelDiscount.layer.cornerRadius = 3
        cell.labelDiscount.clipsToBounds = true
        return cell
    }
}


extension FlashSaleTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width / 2 - 20, height: 200)
    }
}


extension FlashSaleTableViewCell {
    func setupUI() {
        contentView.addSubview(collectionView)
               
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.bottom.left.right.equalToSuperview()
        }
    }
}

