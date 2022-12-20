//
//  GFFollowerVC.swift
//  GitHubFollower
//
//  Created by Admin on 19/12/22.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "GitHub Followers")
        
    }
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}

