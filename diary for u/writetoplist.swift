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
        
 //设置key为时间＋天气
        var keyforsearch:String=strNowTime+"weather"
        
   //写入天气
        data?.setValue(data0, forKey: keyforsearch)
        data?.writeToFile(path, atomically: true)
        
    //随机天气描述
        var randdescriptionforweatherdata=[]
        
        switch data0
        {
        case "sunny":
        randdescriptionforweatherdata=["天气真好啊","sunny呢～","这么好的天，该出去玩才对啊","r test1","s test2","s test3","s test4"]
       
        case "rainny":
       randdescriptionforweatherdata=["下雨天了怎么办","下吧下吧我要开花","holly shit","s test1","r test2","r test3","r test4"]
            
        default :randdescriptionforweatherdata=["nothing"]
        }
        var num :UInt32 = UInt32(randdescriptionforweatherdata.count)
        let diceFaceCount: UInt32 = num
        let randomRoll = Int(arc4random_uniform(diceFaceCount))
        
        var randdescriptionforweather:String="今天天气是"
        
        randdescriptionforweather=randdescriptionforweatherdata[randomRoll] as! String
        
     //天气描述key
        var keyforsearchforweather:String=strNowTime+"weatherdescription"
        
  //写入天气描述
        data?.setValue(randdescriptionforweather, forKey: keyforsearchforweather)
        
        data?.writeToFile(path, atomically: true)
    }
}