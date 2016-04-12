//
//  readmood.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class readmood{


    func readmooddata()->String
    
    
    {
    
        //获取时间
        var getdate = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(getdate) as String
        
        
        //读取数据
        
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
        
        var data=NSMutableDictionary(contentsOfFile:path)
        
        
        var keyforsearch:String=strNowTime+"mooddescription"
        
        var moodstate=data![keyforsearch] as! String
        
        return moodstate


    }

    func readorign()->String
    {
        
        //获取时间
        var getdate = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(getdate) as String
        
        
        //读取数据
        
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("sample.plist")
        
        var data=NSMutableDictionary(contentsOfFile:path)
        
        
        var keyforsearch:String=strNowTime+"mood"
        
        var weatherstate=data![keyforsearch] as! String
        return weatherstate
        
    }

}