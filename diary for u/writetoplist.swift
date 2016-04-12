//
//  writetoplist.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class writeweathertoplist{

    func  write(data0:String){
        //shijian
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(date) as String
        //shijian

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
        
        data?.setValue(data0, forKey: keyforsearch)
        
        data?.writeToFile(path, atomically: true)
        var randdescriptionforweatherdata=[]
        
        if data0 == "sunny"
        {randdescriptionforweatherdata=["天气真好啊","sunny呢～","这么好的天，该出去玩才对啊","test1","test2","test3","test4"]}
        else
        {
       randdescriptionforweatherdata=["下雨天了怎么办","下吧下吧我要开花","holly shit","test1","test2","test3","test4"]
        }
        var num :UInt32 = UInt32(randdescriptionforweatherdata.count)
        let diceFaceCount: UInt32 = num
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
        
        var randdescriptionforweather:String="今天天气是"
        
        randdescriptionforweather=randdescriptionforweatherdata[randomRoll] as! String
        
        var keyforsearchforweather:String=strNowTime+"weatherdescription"
        
        data?.setValue(randdescriptionforweather, forKey: keyforsearchforweather)
        
        data?.writeToFile(path, atomically: true)
    }
}