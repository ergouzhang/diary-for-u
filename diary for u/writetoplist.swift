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
        randdescriptionforweatherdata=["天气真好啊","sunny呢～","这么好的天，该出去玩才对啊","太阳天空照，花儿对我笑","要洗～今天天气不错哦","u are my sunshine～","今天阳光充沛哟！","天气：晴～～☀️"]
       
        case "rainny":
       randdescriptionforweatherdata=["下雨天了怎么办","下吧下吧我要开花","","雨下的那么深，下的那么认真嗯～","云青青兮欲雨，水澹澹兮生烟","雨天，在不开灯的房间","天气：雨～～☔️"]
            
        case "nosun" :randdescriptionforweatherdata=["我的太阳你在哪","阴天，在不开灯的房间","天气：阴～～☁️","虽然阴天，当时也要保持好心情","阴天比较适合在家睡觉",]
            case "snow":randdescriptionforweatherdata=["天气：雪～～❄️","哇，下雪了！","雪一片一片一片～","雪下的那么深，下的那么认真嗯","银妆素裹咯～"]
            case "cloudy": randdescriptionforweatherdata=["万里～～多云","天气：多云"," 天上好多棉花糖哦哦哦","天山的云会飘到哪里去呢","云～～☁️"]
        default:randdescriptionforweatherdata=["nothing"]
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