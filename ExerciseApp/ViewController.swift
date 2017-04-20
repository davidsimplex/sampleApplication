//
//  ViewController.swift
//  ExerciseApp
//
//  Created by Sierra2 on 19/4/17.
//  Copyright © 2017 Sierra2. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var allPosts = [[String : Any]]()
    
    
    var tableView = UITableView()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViews()
        let wb = WebhoseService.init()
        wb.getPosts(){ posts in
            if posts.count > 0 {
                print("loaded")
                self.allPosts = posts as! [[String : Any]]
                DispatchQueue.main.sync{
                    self.tableView.reloadData()
                }
                 
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func createViews() {
        
        
        self.tableView.frame = CGRect(x: 10, y: 30, width: 400, height: 500)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        
        let post = self.allPosts[indexPath.row]
        
        let postTitle = (post["title"] as! String)
        if postTitle != "" {
            cell.textLabel!.text = postTitle
        }else{
            cell.textLabel!.text = "This post has no title"
        }
        
        
        let thread = post["thread"] as? Dictionary<String , Any>

        if let imgUrl = thread?["main_image"] as? String {
            cell.imageView?.sd_setImage(with: NSURL(string: imgUrl)! as URL)
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = allPosts[indexPath.row]
        let postTitle =  post["title"] as! String
        let postText = post["text"] as! String
        let thread = post["thread"] as! Dictionary<String, Any>
        let postImgUrl = thread["main_image"] as? String
        
        let detailedVC = DetailedInfoViewController(title: postTitle, imgUrl: postImgUrl, text: postText)
        
        self.navigationController?.pushViewController(detailedVC, animated: true)
        
    }

}

