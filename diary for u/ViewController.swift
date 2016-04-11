//
//  ViewController.swift
//  diary for u
//
//  Created by zwj on 16/4/11.
//  Copyright © 2016年 zwj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btn(sender: AnyObject) {
        
        //读取数据
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
        
        var data=NSMutableDictionary(contentsOfFile:path)
    
        print(path)
        print(data!["weather2"])
        label.text=data!["weather"]! as! String
//读取数据
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

