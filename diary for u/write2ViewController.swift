//
//  write2ViewController.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//mood

import UIKit

class write2ViewController: UIViewController {
   
    @IBOutlet weak var image: UIImageView!
  
    
    var mood = writemood()
    
    
    //心情：有点儿烦
    @IBAction func littleunhappy(sender: AnyObject) {
       mood.moodtowrite("unhappylittle")

        image.image=UIImage(named: "littleunhappy.jpg")
        
    }
    
    //心情：soso
    @IBAction func soso(sender: AnyObject) {
        
          mood.moodtowrite("soso")
         image.image=UIImage(named: "soso.gif")
    }
    
    
    //心情：开心
    @IBAction func happy(sender: AnyObject) {
        
          mood.moodtowrite("happy")
         image.image=UIImage(named: "happy.jpg")
    }
    
    
    
    
    @IBOutlet weak var weather: UILabel!

   
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
      
        super.viewDidLoad()

        //获取时间
        let getdate = timetoget()
        date.text = getdate.gettime()

        //读取天气
        var read = readweatherfromplist()
         weather.text=read.read()
        
        
    }
 
    
        
     
        
        
        
        
            


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }
