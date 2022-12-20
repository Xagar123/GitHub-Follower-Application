//
//  FollowerCell.swift
//  GitHubFollower
//
//  Created by Admin on 18/12/22.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLable = GFTitleLable(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       // contentView.backgroundColor = .systemBlue
        configureImageView()
       configureLable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLable.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
        
    }
    
    private func configureImageView() {
        addSubview(avatarImageView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            avatarImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
            
        ])
        
    }
    
    func configureLable() {
        addSubview(usernameLable)
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            usernameLable.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLable.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
}
