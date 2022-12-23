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
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLable.text = message
    }
    
    private func configure(){
        configureLogoImageView()
        configureMessageLable()
        
    }
    
    private func configureMessageLable() {
        addSubview(messageLable)
        messageLable.numberOfLines = 3
        messageLable.textColor     = .secondaryLabel
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        
        let lableCenterYcontraint: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -100 : -150
        
        let messageLableCenterYConstraint = messageLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: lableCenterYcontraint)
        messageLableCenterYConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            messageLable.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            messageLable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            messageLable.heightAnchor.constraint(equalToConstant: 200)])
    }
    
    private func configureLogoImageView() {
        
        addSubview(logoImageView)
        logoImageView.image = Image.emptyState
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 100 : 120
        
        let logoImageViewBottomConstrain = logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
        logoImageViewBottomConstrain.isActive = true
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            //logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170)
            
        ])
    }
    
    
}
