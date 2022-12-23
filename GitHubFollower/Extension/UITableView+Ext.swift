//
//  UITableView+Ext.swift
//  GitHubFollower
//
//  Created by Admin on 23/12/22.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    func removeExcessCell() {
        tableFooterView = UIView(frame: .zero)
    }
}
