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
    randdescriptionforweatherdata=["倍儿爽～～爽～爽～爽～","今个真高兴～😊","心情不错！ 么么哒！","哈哈哈哈😄～","今天很开心哟","yo yo yoooooo"]
    
    case "soso":
        randdescriptionforweatherdata=["今天过的没啥感觉～","好无聊，来点刺激的啊！","日子每天都过的差不多唉","今天也就那样吧","日子就在那里，不悲不喜"]
        case "unhappylittle":
    randdescriptionforweatherdata=["不 开 心 ！ 不 开 心！ 不 开 心！","what the fxuk","看我眼神！😠","去你大爷的，老子不爽！","别理我，烦！"]
    
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