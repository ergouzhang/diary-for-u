//
//  calendarpanduan.swift
//  diary for u
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//

import Foundation

class writtenornot{


    func written()->AnyObject{
    
    
        //获取时间
        var getdate = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        var strNowTime = timeFormatter.stringFromDate(getdate) as String
        
        
        //读取数据
        
        var paths=NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var doucumentsDirectory:AnyObject=paths[0]
        
        var path = doucumentsDirectory.stringByAppendingPathComponent("canlendar.plist")
        
        var data=NSMutableDictionary(contentsOfFile:path)
        
        
      var date = data?.allKeys
        return date!
    }
        
        
        func day()->[Int]{
    var date = written()
        var i:Int
        var day=[Int]()
        var month=[Int]()
        
        //date转换成string
        var datetomark = [String]()
        
        for date0 in date as! [String]
      {  datetomark.append(date0)
     
        }
        
        for i in 0...datetomark.count-1{
        
        
        //取日期,转换成int
       day.append(Int((datetomark[i] as NSString).substringWithRange(NSMakeRange(8, 2)))!)


        }
        
   return day
    }
    
    
    //月份转换成int数组
    func month()->[Int]{
        var date = written()
        var ns1:String
        var ns2:Int
        var ns3:String
        var ns4:Int=0
        var i:Int
        var day=[Int]()
        var month=[Int]()
        
        //date转换成string
        var datetomark = [String]()
        
        for date0 in date as! [String]
        {  datetomark.append(date0)
            
        }
        
        for i in 0...datetomark.count-1{
            
            
            //取月份,转换成int
            month.append(Int((datetomark[i] as NSString).substringWithRange(NSMakeRange(5, 2)))!)
            
        }
        
        return month
    }

    
    
   
  }
    


