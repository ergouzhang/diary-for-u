//
//  writemood.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class writemood{

    func moodtowrite(mood:String)
    
{
    
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
    var keyforsearch:String=strNowTime+"mood"
    
    //写入心情
    data?.setValue(mood, forKey: keyforsearch)
    data?.writeToFile(path, atomically: true)

    
    
    //随机心情
    var randdescriptionforweatherdata=[]
    
    switch mood {
        
    case "happy":
    randdescriptionforweatherdata=["倍儿爽","h 1 ","h 2","h test1","h test2","h test3","h test4"]
    
    case "soso":
        randdescriptionforweatherdata=["生活乐趣在哪～","生活乐趣在哪～2","生活乐趣在哪～3","生活乐趣在哪～4"]
        case "unhappylittle":
    randdescriptionforweatherdata=["人生的乐趣在哪～","人生的乐趣在哪～2"]
    
    default:randdescriptionforweatherdata = ["default"]
        }
    var num :UInt32 = UInt32(randdescriptionforweatherdata.count)
    let diceFaceCount: UInt32 = num
    let randomRoll = Int(arc4random_uniform(diceFaceCount))
    
    var randdescriptionforweather:String="今天心情是"
    
    randdescriptionforweather=randdescriptionforweatherdata[randomRoll] as! String
    
    //心情描述key
    var keyforsearchforweather:String=strNowTime+"mooddescription"
    
    //写入心情描述
    data?.setValue(randdescriptionforweather, forKey: keyforsearchforweather)
    
    data?.writeToFile(path, atomically: true)

    
    
    
    }
    




}