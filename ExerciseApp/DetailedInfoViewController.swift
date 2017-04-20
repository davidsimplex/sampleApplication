//
//  DetailedInfoViewController.swift
//  ExerciseApp
//
//  Created by Sierra2 on 20/4/17.
//  Copyright © 2017 Sierra2. All rights reserved.
//

import UIKit
import SDWebImage

class DetailedInfoViewController: UIViewController {

    
    var postTitle : String? = ""
    var imgUrl : String? = ""
    var postText  : String? = ""
    
    convenience init(title : String?, imgUrl :String?, text : String?) {

        self.init(nibName: nil, bundle: nil)
        
        self.postTitle = title
        self.imgUrl = imgUrl
        self.postText = text
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 40, width: self.view.frame.width-40, height: 70))
        titleLabel.text = self.postTitle
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.view.addSubview(titleLabel)
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: titleLabel.bounds.maxY+25, width: self.view.frame.width-40, height: 250))
        
        if self.imgUrl != nil && self.imgUrl != ""  {
            imageView.sd_setImage(with: NSURL (string :self.imgUrl!)! as URL)
        }
        self.view.addSubview(imageView)
        
        let text = UITextView(frame: CGRect(x: 20, y: imageView.bounds.maxY+20, width: self.view.frame.width-40, height: 400))
        text.text = self.postText
        self.view.addSubview(text)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
