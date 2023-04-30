//
//  LatestTableViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 23.03.2023.
//

import UIKit

class LatestTableViewCell: UITableViewCell {
    
    
    var latest = [Latest]() {
        didSet {
            collectionView.reloadData()
        }
    }

    private lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 114, height: 149)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewIdentifiers.latest)
        return collectionView
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



extension LatestTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        latest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewIdentifiers.latest, for: indexPath) as! LatestCollectionViewCell
        cell.latest = latest[indexPath.item]
        cell.setupUI()
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.imageCircle.layer.cornerRadius = 12.5
        cell.imageCircle.clipsToBounds = true
        return cell
    }
}


extension LatestTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}


extension LatestTableViewCell {
    func setupUI() {
        contentView.addSubview(collectionView)
               
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.bottom.left.right.equalToSuperview()
        }
    }
}

