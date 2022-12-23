//
//  GFFollowerVC.swift
//  GitHubFollower
//
//  Created by Admin on 19/12/22.
//

import UIKit
protocol GFFollowerItemVCDelegate: class {
    
    func didTapGetFollowers(for user: User)
}


class GFFollowerItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowerItemVCDelegate!
    
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

