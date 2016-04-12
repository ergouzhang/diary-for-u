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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //读取时间
        var date = timetoget()
        datelabel?.text=date.gettime()
       
        //读取天气
        var weather = readweatherfromplist()
        weatherlabel?.text = weather.read()
        
        //读取心情
        var mood = readmood()
        moodlabel?.text=mood.readmooddata()
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
