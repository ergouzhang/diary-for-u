//
//  write.swift
//  diary fo u
//
//  Created by zwj on 16/4/11.
//  Copyright © 2016年 zwj. All rights reserved.
//

import UIKit
import CoreData


class write1ViewController: UIViewController{
    

  
    
  
    
//天气图像显示区域
    @IBOutlet weak var weatherdisp: UIImageView!
    
    @IBOutlet weak var dateShow: UILabel!
    
//若是雨天
    @IBAction func rainny(sender: AnyObject) {
    
//写入天气数据
        var plist=writeweathertoplist()
        
        plist.write("rainny")

//呈现天气图像
        weatherdisp.image=UIImage(named: "rainny.gif")
    }
    
    //－－－－－－－－－－－－－－－－－－－
//若是晴天
    @IBAction func sunny(sender: AnyObject) {
        
        
//写入天气数据
    var plist=writeweathertoplist()
        
        plist.write("sunny")
        
      
        
//呈现天气图像
        weatherdisp.image=UIImage(named: "sunny.jpg")

       
    
        
        
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //获取时间
        var getdate=timetoget()
        
//设置时间
        dateShow.text = getdate.gettime()
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //coredate:
    
  

    
}


