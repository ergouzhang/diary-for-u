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
    

  
    
    //定义天气变量
    var weather:AnyObject!
    
    //天气图像显示区域
    @IBOutlet weak var weatherdisp: UIImageView!
    
    @IBOutlet weak var dateShow: UILabel!
    
    
    @IBAction func rainny(sender: AnyObject) {
        
        //shijian
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(date) as String
        //shijian

        
        //plist 写入
        
        
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
        
        var fileManager = NSFileManager.defaultManager()
        
        var fileExists:Bool = fileManager.fileExistsAtPath(path)
        
        var data:NSMutableDictionary?
        
        if fileExists == false{
            
            data=NSMutableDictionary()}
        else{
            data=NSMutableDictionary(contentsOfFile:path)
        }


         var keyforsearch:String=strNowTime+"weather"
               data?.setValue("rainny", forKey: keyforsearch)
        
        data?.writeToFile(path, atomically: true)
        
       //plist写入
        
        
        //呈现天气图像
        weatherdisp.image=UIImage(named: "rainny.gif")
        //--------------------------“
        
   
        
        
    }
    @IBAction func sunny(sender: AnyObject) {
        //shijian
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(date) as String
//shijian
        
        
        //plist写入
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
        
        var fileManager = NSFileManager.defaultManager()
        
        var fileExists:Bool = fileManager.fileExistsAtPath(path)
        
        var data:NSMutableDictionary?
        
        if fileExists == false{
            
            data=NSMutableDictionary()}
        else{
            data=NSMutableDictionary(contentsOfFile:path)
        }
        var keyforsearch:String=strNowTime+"weather"
        
        data?.setValue("sunny", forKey: keyforsearch)
        
        data?.writeToFile(path, atomically: true)
        //plist写入
        
        
        //呈现天气图像
        weatherdisp.image=UIImage(named: "sunny.jpg")

        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取时间
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(date) as String
        //获取时间
        
        dateShow.text=strNowTime  //设置时间
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //coredate:
    
    
    
}


