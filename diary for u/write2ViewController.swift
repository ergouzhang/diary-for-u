//
//  write2ViewController.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import UIKit

class write2ViewController: UIViewController {
   
    @IBAction func littleunhappy(sender: AnyObject) {
//        //shijian
//        var date = NSDate()
//        var timeFormatter = NSDateFormatter()
//        timeFormatter.dateFormat = "yyy-MM-dd"
//        var strNowTime = timeFormatter.stringFromDate(date) as String
//        //shijian
//
//        //plist写入
//        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        var doucumentsDirectory:AnyObject=paths[0]
//        
//        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
//        
//        var fileManager = NSFileManager.defaultManager()
//        
//        var fileExists:Bool = fileManager.fileExistsAtPath(path)
//        
//        var data:NSMutableDictionary?
//        
//        if fileExists == false{
//            
//            data=NSMutableDictionary()}
//        else{
//            data=NSMutableDictionary(contentsOfFile:path)
//        }
//        var keyforsearch:String=strNowTime+"mood"
//        
//        data?.setValue("sunny", forKey: keyforsearch)
//        
//        data?.writeToFile(path, atomically: true)
//        //plist写入

        
        
    }
    @IBAction func soso(sender: AnyObject) {
    }
    @IBAction func happy(sender: AnyObject) {
    }
    @IBOutlet weak var weather: UILabel!

   
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
      
        super.viewDidLoad()

        
        let getdate = timetoget()
        
    
//        //获取时间
//        var getdate = NSDate()
//        var timeFormatter = NSDateFormatter()
//        timeFormatter.dateFormat = "yyy-MM-dd"
//        var strNowTime = timeFormatter.stringFromDate(getdate) as String
//        //获取时间
        
        date.text = getdate.gettime()
        //设置时间
        //---------------

//        //设置天气
//        //读取数据
//        
//        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        
//        var doucumentsDirectory:AnyObject=paths[0]
//        
//        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
//        
//        var data=NSMutableDictionary(contentsOfFile:path)
//        
//        
//        var keyforsearch:String=strNowTime+"weatherdescription"
        
        //read.class
        var read = readweatherfromplist()
    
        
        
      
        //读取数据
        //---------------

        
       
        
        //天气的随机话语
        
//        var randdescriptionforweather:String="今天天气是"
//        
//        if data![keyforsearch]as! String == "sunny"
//        {
//            var randdescriptionforweatherdata=["天气真好啊","sunny呢～","这么好的天，该出去玩才对啊","test1","test2","test3","test4"]
//            var num :UInt32 = UInt32(randdescriptionforweatherdata.count)
//            let diceFaceCount: UInt32 = num
//            let randomRoll = Int(arc4random_uniform(diceFaceCount))
//            randdescriptionforweather=randdescriptionforweatherdata[randomRoll]
        
            //显示天气
            weather.text=read.read()
        }
        
        
    
        //天气的随机话语
        
//        
//        if data![keyforsearch]as! String == "rainny"
//        {
//            var randdescriptionforweatherdata=["下雨天了怎么办","下吧下吧我要开花","holly shit","test1","test2","test3","test4"]
//            var num :UInt32 = UInt32(randdescriptionforweatherdata.count)
//            let diceFaceCount: UInt32 = num
//            let randomRoll = Int(arc4random_uniform(diceFaceCount))
//            randdescriptionforweather=randdescriptionforweatherdata[randomRoll]
//            
//            //显示天气
     // weather.text=" \(randdescriptionforweather)"
//        }
//
    
        
     
        
        
        
        
            


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
