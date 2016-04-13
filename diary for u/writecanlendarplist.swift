//
//  writecanlendarplist.swift
//  diary for u
//
//  Created by zwj on 16/4/13.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class writecalendarplist{
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
    
    var path = doucumentsDirectory.stringByAppendingPathComponent("canlendar.plist")
    
    var fileManager = NSFileManager.defaultManager()
    
    var fileExists:Bool = fileManager.fileExistsAtPath(path)
    
    var data:NSMutableDictionary?
    
    if fileExists == false{
        
        data=NSMutableDictionary()}
    else{
        data=NSMutableDictionary(contentsOfFile:path)
    }
    
    //设置key为时间
    var keyforsearch:String=strNowTime
    
    //写入心情
    data?.setValue(diary, forKey: keyforsearch)
    data?.writeToFile(path, atomically: true)
    
    
    
    }
    
}