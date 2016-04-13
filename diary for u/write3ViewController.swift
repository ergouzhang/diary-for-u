//
//  write3ViewController.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import UIKit

class write3ViewController: UIViewController {
    
    @IBOutlet var datelabel:UILabel?
    @IBOutlet var weatherlabel:UILabel?
    @IBOutlet var moodlabel:UILabel?
    @IBOutlet var diary:UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //写入之前数据，并进行整合
       var write = writetodiary()
        write.combine()
        
        
        //读到整合数据
        var read = readdiary()
        
        
        var diraydata=read.read()
        diary?.text=read.read()
        
        
        //写入日历plist
        
        var writetocalendar = writecalendarplist()
        writetocalendar.write(diraydata)
      

        
      
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
