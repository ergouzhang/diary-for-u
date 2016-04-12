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
        
        //shijian
//        var date = NSDate()
//        var timeFormatter = NSDateFormatter()
//        timeFormatter.dateFormat = "yyy-MM-dd"
//        var strNowTime = timeFormatter.stringFromDate(date) as String
//        //shijian
//        //读取数据
//        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        
//        var doucumentsDirectory:AnyObject=paths[0]
//        
//        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
//        
//        var data=NSMutableDictionary(contentsOfFile:path)
//    
////       var keyfordata=strNowTime+"weather"
//        print(keyfordata)
//        
//        label.text="\(data![keyfordata]! as! String)"
//读取数据
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

