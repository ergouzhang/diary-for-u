//
//  writetodiary.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class writetodiary {

    func combine(){
    
        //读取时间
        var date = timetoget()
        date.gettime()
        
        //读取天气
        var weather = readweatherfromplist()
        weather.read()
        
        //读取心情
        var mood = readmood()
       mood.readmooddata()
    
        var diary = []
    
    if weather.readorign() == "sunny" && mood.readorign() == "happy"
        
    {
     diary = ["diary1","diary2","diary3"]
        
        var num :UInt32 = UInt32(diary.count)
        let diceFaceCount: UInt32 = num
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
 
        write(diary[randomRoll] as! String)
        
        }
    else {
        
        diary = ["nothing"]
        
        write(diary[0] as! String)
        
        }
    
    
    }
    
    
    
    
    
    
    
    func write(diary:String){
    
    
        //shijian
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(date) as String
        //shijian
        
        //获取plist路径
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
        
        //设置key为时间＋心情
        var keyforsearch:String=strNowTime
        
        //写入心情
        data?.setValue(diary, forKey: keyforsearch)
        data?.writeToFile(path, atomically: true)

    

    
        
    
    }




}