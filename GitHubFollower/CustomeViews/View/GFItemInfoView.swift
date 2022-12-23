//
//  GFItemInfoView.swift
//  GitHubFollower
//
//  Created by Admin on 19/12/22.
//

import UIKit


class GFItemInfoView: UIView {

    enum ItemInfoType {
        case repos, gists, followers, following
    }
    let symbolImageView = UIImageView()
    let titleLable = GFTitleLable(textAlignment: .left, fontSize: 14)
    let countLable = GFTitleLable(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubViews(symbolImageView,titleLable,countLable)
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLable.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: symbolImageView.leadingAnchor, constant: 28),
            titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLable.heightAnchor.constraint(equalToConstant: 18),
            
            countLable.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLable.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
            
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLable.text = "Public Repos"
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLable.text = "Public Gists"
            
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLable.text = "followers"
        case .following:
            symbolImageView.image = SFSymbols.following
            titleLable.text = "following"
        }
        countLable.text = String(count)
    }
}
