//
//  GFEmptyStateView.swift
//  GitHubFollower
//
//  Created by Admin on 19/12/22.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLable = GFTitleLable(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLable.text = message
        configure()
    }
    
    private func configure(){
        addSubview(logoImageView)
        addSubview(messageLable)
        
        messageLable.numberOfLines = 3
        messageLable.textColor     = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            messageLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            messageLable.heightAnchor.constraint(equalToConstant: 200),
            
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            //logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 120)
        ])
        
        
    }
    
}
