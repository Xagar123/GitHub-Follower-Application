//
//  GFUserinfoHeaderVC.swift
//  GitHubFollower
//
//  Created by Admin on 19/12/22.
//

import UIKit

class GFUserinfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLable = GFTitleLable(textAlignment: .left, fontSize: 34)
    let nameLable = GFSecondaryTitleLable(fontSize: 18)
    let locationImageView = UIImageView ()
    let locationLable = GFSecondaryTitleLable(fontSize: 18)
    let bioLable = GFBodyLable(textAlignment: .left)
    
    var user: User!
    
    init(user: User!) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubViews()
        layoutUI()
        configureUIElement()
    }
    
    func configureUIElement() {
        downloadAvatarImage()
        usernameLable.text = user.login
        nameLable.text = user.name ?? ""
        locationLable.text = user.location ?? "No location"
        bioLable.text = user.bio ?? "No bio available"
        bioLable.numberOfLines = 3
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
    }
    
    func downloadAvatarImage() {
        // avatarImageView.downloadImage(from: user.avatarUrl)
         NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
             guard let self = self else { return}
             DispatchQueue.main.async {
                 self.avatarImageView.image = image
             }
         }
    }
    
    func addSubViews() {
        view.addSubViews(avatarImageView,usernameLable,nameLable,locationImageView,locationLable,bioLable)
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        locationLable.translatesAutoresizingMaskIntoConstraints = false
        bioLable.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLable.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLable.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLable.heightAnchor.constraint(equalToConstant: 38),

            
            nameLable.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLable.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLable.heightAnchor.constraint(equalToConstant: 38),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            

            locationLable.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLable.leadingAnchor.constraint(equalTo: locationImageView.leadingAnchor, constant: 25),
            locationLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLable.heightAnchor.constraint(equalToConstant: 20),
            
            
            bioLable.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLable.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLable.heightAnchor.constraint(equalToConstant: 90)
        ])
    }


}
