//
//  Date+Ext.swift
//  GitHubFollower
//
//  Created by Admin on 20/12/22.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
