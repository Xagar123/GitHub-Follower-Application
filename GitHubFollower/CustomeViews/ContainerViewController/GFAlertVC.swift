//
//  GFAlertVC.swift
//  GitHubFollower
//
//  Created by Admin on 17/12/22.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = GFAlertContainerView()
    let titleLable = GFTitleLable(textAlignment: .center, fontSize: 20)
    let messageLable = GFBodyLable(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Okay")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    var padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(containerView,titleLable,actionButton,messageLable)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContainerView()
        configureTitleLable()
        configureActionButton()
        configureMessageLable()
        
    }
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    func configureTitleLable() {
        titleLable.text = alertTitle ?? "Something went wrong"
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLable.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureMessageLable() {
        messageLable.text = message ?? "Unable to complete request"
        messageLable.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            messageLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLable.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    


}
