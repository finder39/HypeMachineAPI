//
//  UsersRequests.swift
//  HypeMachineAPI
//
//  Created by Alex Marchant on 5/13/15.
//  Copyright (c) 2015 Plug. All rights reserved.
//

import Foundation
import Alamofire

extension Requests {
    public struct Users {
        public static func show(#username: String, callback: (user: User?, error: NSError?)->Void) {
            Alamofire.request(Router.Users.Show(username)).validate().responseObject {
                (request, response, user: User?, error) in
                callback(user: user, error: error)
            }
        }
        
        public static func showFavorites(#username: String, optionalParams: [String: AnyObject]?, callback: (tracks: [Track]?, error: NSError?)->Void) {
            Alamofire.request(Router.Users.ShowFavorites(username, optionalParams)).validate().responseCollection {
                (request, response, tracks: [Track]?, error) in
                callback(tracks: tracks, error: error)
            }
        }
        
        public static func showFriends(#username: String, optionalParams: [String: AnyObject]?, callback: (users: [User]?, error: NSError?)->Void) {
            Alamofire.request(Router.Users.ShowFriends(username, optionalParams)).validate().responseCollection {
                (request, response, users: [User]?, error) in
                callback(users: users, error: error)
            }
        }
    }
}