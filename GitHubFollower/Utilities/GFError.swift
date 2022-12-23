//
//  GFError.swift
//  GitHubFollower
//
//  Created by Admin on 18/12/22.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername  = "This user name doesn't exit. please try again"
    case unableToComplete = "Unable to complete your request. please check your internet connection"
    case invalidResponse  = "Invalid response from the server. Please try again."
    case invalidData      = "Invalid data received from the server. Please try again."
    case unableToFavorites = "There was an error favoriting this user. Please try again"
    case alreadyInFavorites = "You've already favorited this user. You must really like them!"
}
