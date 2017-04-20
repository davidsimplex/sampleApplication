//
//  WebhoseService.swift
//  ExerciseApp
//
//  Created by Sierra2 on 19/4/17.
//  Copyright © 2017 Sierra2. All rights reserved.
//

import WebhoseKit

class WebhoseService {
    let API_TOKEN = "12f0cf6a-9cd4-4cc8-bf3d-12bce245b6a9"

    
    open func getPosts(completitionHandler : @escaping (Array<Any>) -> ()){
        var query = ["q": "gay", "language" : "english"]
        
        WebhoseKit.config(token: API_TOKEN)
        WebhoseKit.query(endpoint: "filterWebContent", query: &query) { (error, json) in
            if (error == nil){
                let posts = json!["posts"] as! [[String: Any]]
                
                if posts.count > 0 {
                    completitionHandler(posts)
                    
                    
                }else{
                    completitionHandler([])
                    print("there is no posts :( ")
                }
            }
        }
    }
}
