//
//  can.swift
//  canlendar
//
//  Created by zwj on 16/4/12.
//  Copyright © 2016年 zwj. All rights reserved.
//
//  PlanAndTarget
//
//  Created by  scs on 15/10/13.
//  Copyright © 2015年  scs. All rights reserved.
//

import UIKit

@IBDesignable
class CalendarView: UIView {
    
    var CurrentYear : Int = 1988
    var CurrentMonth:Int = 03
    var CurrentDay:Int=27
    var PickedDay : Int = 1
    
    //获取canlendar.plist
    var readcanlendarplist = writtenornot()
    
    var datetomark = [String]()
    
    var ns1 = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        var date = NSDate()
        var timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyyy"
        var strNowTimeYear = Int(timeFormatter.stringFromDate(date))
        CurrentYear=strNowTimeYear!
        
        timeFormatter.dateFormat = "MM"
        var strNowTimeMoth = Int(timeFormatter.stringFromDate(date))
        CurrentMonth = strNowTimeMoth!
        
        timeFormatter.dateFormat = "dd"
        var strNowTimeDay = Int(timeFormatter.stringFromDate(date))
        CurrentDay = strNowTimeDay!
        
        PickedDay = CurrentDay
        
        //获取canlendar.plists
     var datewritten = readcanlendarplist.written()
       
        
        for date in datewritten as! [String]
        {  datetomark.append(date)
        
        }
        print(datetomark)
        print(ns1)
        
    }
    
    
    
    //var CurrentMonth : Int = 10
    //        {
    //        didSet{
    //            if self.CurrentMonth < 0 || self.CurrentMonth > 12 {
    //                self.CurrentMonth = 1
    //            }
    //            setNeedsDisplay()
    //        }
    //    }
    
    
    var padding : CGFloat = 20
    // {
    //        didSet{
    //            if (self.padding > 50 ) {
    //                self.padding = 100
    //            }
    //            setNeedsDisplay()
    //        }
    //    }
    
    // @IBInspectable
    var mergin : CGFloat = 20
    //        {
    //        didSet{
    //            if (self.mergin > 50 ) {
    //                self.mergin = 100
    //            }
    //            setNeedsDisplay()
    //        }
    //    }
    
    @IBInspectable
    var RowHeight : CGFloat = 20{
        didSet{
            if (self.RowHeight > 100 ) {
                self.RowHeight = 100
            }
            setNeedsDisplay()
        }
    }
    
    //    @IBInspectable
    //    var PickedDay : Int = 1
    //        {
    //        didSet{
    //            if (self.PickedDay < 0){
    //                self.PickedDay = 1
    //            }
    //            let lastDay = getLastDay( CurrentYear, month: CurrentMonth)
    //            if (self.PickedDay > lastDay!){
    //                self.PickedDay = lastDay!
    //            }
    //            setNeedsDisplay()
    //        }
    //    }
    
    
    
    
    //MARK: - Calendar
    //按照苹果的习惯，周日放在第一位
    let weekdayForDisplay = ["周日","周一","周二","周三","周四","周五","周六"]
    
    
    //获取周 周日：1 － 周六：7
    func getWeekDay(year:Int,month:Int,day:Int) ->Int{
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        let date:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/%02d",year,month,day));
        if date != nil {
            let calendar:NSCalendar = NSCalendar.currentCalendar()
            let dateComp:NSDateComponents = calendar.components(NSCalendarUnit.NSWeekdayCalendarUnit, fromDate: date!)
            return dateComp.weekday;
        }
        return 0;
    }
    
    //这个月的最后一天
    //先获得下个月的第一天，然后在此基础上减去24小时
    //注意这里的时间Debug的时候是UTC
    func getLastDay(var year:Int,var month:Int) -> Int?{
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        if month == 12 {
            month = 0
            year++
        }
        let targetDate:NSDate? = dateFormatter.dateFromString(String(format:"%04d/%02d/01",year,month+1));
        if targetDate != nil {
            
            let orgDate = NSDate(timeInterval:(24*60*60)*(-1), sinceDate: targetDate!)
            let str:String = dateFormatter.stringFromDate(orgDate)
            return Int((str as NSString).componentsSeparatedByString("/").last!);
        }
        
        return nil;
    }
    
    //MARK: - Event
    //记录每天的格子的Rect
    var DayRect = [Int:CGRect]()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let SignleTouch = touches.first!
        let Touchpoint = SignleTouch.locationInView(self)
        let pick = getDayByTouchPoint(Touchpoint)
        print("TouchPoint : X = \(Touchpoint.x) Y = \(Touchpoint.y)  Day: \(pick)")
        
        // if pick != 0 {self.PickedDay = pick }
        PickedDay = pick
    }
    
    //根据触摸点获取日期
    func getDayByTouchPoint(touchpoint:CGPoint) -> Int {
        for day in DayRect{
            if day.1.contains(touchpoint){
                return day.0
            }
        }
        return 0
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.Center
        //查资料可知默认字体为12
        let NSDefaultFontSize : CGFloat = 12;
        
        //绘制表头
        let UseableWidth :CGFloat = rect.width - (padding + mergin) * 2;
        let WeekdayColumnWidth : CGFloat = UseableWidth / 7
        var leftside  : CGFloat = padding + mergin
        for i in 0...6{
            let text  =  NSMutableAttributedString(string: weekdayForDisplay[i],attributes: [NSParagraphStyleAttributeName: paragraph])
            let CellRect = CGRect(x: leftside  , y:padding + mergin, width: WeekdayColumnWidth, height: RowHeight)
            text.drawInRect(CellRect)
            leftside += WeekdayColumnWidth
        }
        
        //绘制当月每天
        var rowCount = 1;
        leftside  = padding + mergin
        let today = NSDate()
        let calendar = NSCalendar(identifier: NSGregorianCalendar)
        let comps:NSDateComponents = calendar!.components([NSCalendarUnit.Year,NSCalendarUnit.Month,NSCalendarUnit.Day], fromDate: today)
        
        print(comps)
        
        //Clear
        DayRect.removeAll()
        
        for day in 1...getLastDay(CurrentYear,month:CurrentMonth)!{
            let weekday = getWeekDay(CurrentYear, month: CurrentMonth, day: day)
            let text  =  NSMutableAttributedString(string: String(day),  attributes: [NSParagraphStyleAttributeName: paragraph])
            let LeftTopX = leftside + CGFloat(weekday - 1) * WeekdayColumnWidth
            let LeftTopY = padding + mergin + RowHeight * CGFloat(rowCount)
            let CellRect :CGRect = CGRect(x: LeftTopX, y: LeftTopY, width: WeekdayColumnWidth, height: RowHeight)
            //            if (PickedDay == day){
            //                //选中的日子，UI效果
            //                let PickRectPath = UIBezierPath(roundedRect: CellRect, cornerRadius: RowHeight/2)
            //                UIColor.blueColor().colorWithAlphaComponent(0.3).setFill()
            //                PickRectPath.fill()
            //            }
            
            if (comps.year == CurrentYear && comps.month == CurrentMonth && comps.day == day){
                text.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(),range:NSMakeRange(0,text.length))
                text.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(NSDefaultFontSize),range:NSMakeRange(0,text.length))
            }
            
            
            text.drawInRect(CellRect)
            DayRect[day] = CellRect
            //绘制了周日之后，需要新的一行
            if weekday == 7 { rowCount++ }
        }
        
        //绘制外框
        //        let path : UIBezierPath = UIBezierPath(rect: CGRect(x: padding, y: padding, width: rect.width - padding * 2 , height: padding + mergin + RowHeight * CGFloat(rowCount - 1) + 10 ))
        //        path.stroke()
        
        //path = UIBezierPath(rect: CGRect(x: padding + mergin, y: padding + mergin, width: rect.width - (padding + mergin) * 2 , height: rect.height - (padding + mergin) * 2))
        //path.stroke()
        
        //        print("LastDay Of 2015/10 : \(getLastDay(CurrentYear, month: CurrentMonth))" )
        //        print("2015/10/18 : \(weekdayForDisplay[getWeekDay(CurrentYear, month: CurrentMonth, day: 18) - 1]  )" )
        //        print("Calendar Size Height: \(rect.height)  Width: \(rect.width)" )
        //        print(CurrentYear)
        //        print(CurrentMonth)
        //        print(CurrentDay)
    }
    
    
    
}