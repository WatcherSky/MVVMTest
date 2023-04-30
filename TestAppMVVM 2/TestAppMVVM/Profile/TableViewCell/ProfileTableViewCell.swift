//
//  ProfileTableViewCell.swift
//  TestAppMVVM
//
//  Created by Владимир on 22.03.2023.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = false
        return image
    }()
    
    
    var rightText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    var containerView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func setupUI(height rowHeight: CGFloat) {
        contentView.addSubview(containerView)
        
        [title, image, rightText].forEach {
            containerView.addSubview($0)
        }
    
        containerView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints{ m in
            m.top.equalTo(rowHeight/3.5)
            m.left.equalTo(image.snp.right).offset(10)
            m.height.equalTo(30)
        }
        
        image.snp.makeConstraints{ m in
            m.left.equalTo(20)
            m.top.equalTo(rowHeight/3.5)
            m.height.equalTo(30)
        }
        
        rightText.snp.makeConstraints { m in
            m.top.equalTo(rowHeight/3.5)
            m.right.equalToSuperview().offset(-50)
            m.height.equalTo(30)
        }
    }
    

}
