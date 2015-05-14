//
//  MiscRequests.swift
//  HypeMachineAPI
//
//  Created by Alex Marchant on 5/13/15.
//  Copyright (c) 2015 Plug. All rights reserved.
//

import Foundation
import Alamofire

extension Requests {
    public struct Misc {
        public static func GetToken(#usernameOrEmail: String, password: String, response: (username: String?, token: String?, error: NSError?)->Void) {
            Alamofire.request(Router.Misc.GetToken(usernameOrEmail, password)).validate().responseJSON {
                (req, resp, JSON, error) in
                let username: String? = JSON?.valueForKeyPath("username") as? String
                let token: String? = JSON?.valueForKeyPath("hm_token") as? String
                response(username: username, token: token, error: error)
            }
        }
    }
}