//
//  ViewController.swift
//  Time to leave
//
//  Created by Raffer Li on 6/28/19.
//  Copyright © 2019 Raffer Li. All rights reserved.
//

import UIKit

var now = Date()
let calendar = Calendar.current

let components4pm = DateComponents(calendar: calendar, hour: 16)
var next4pm = calendar.nextDate(after: now, matching: components4pm, matchingPolicy: .nextTime)!

var diff4pm = DateComponents()

let components10pm = DateComponents(calendar: calendar, hour: 22)
var next10pm = calendar.nextDate(after: now, matching: components10pm, matchingPolicy: .nextTime)!

var diff10pm = DateComponents()

let components11pm = DateComponents(calendar: calendar, hour: 23)
var next11pm = calendar.nextDate(after: now, matching: components11pm, matchingPolicy: .nextTime)!

var diff11pm = DateComponents()

var diffclockedTime = DateComponents()

var secondTick: Timer?

class ViewController: UIViewController {
    
    
    let index = Calendar.current.component(.weekday, from: Date()) // this returns an Int
    
    
    
    var openBool = true
    var closeBool = false
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var zeroHour: UILabel!
    @IBOutlet weak var zeroMin: UILabel!
    @IBOutlet weak var zeroSec: UILabel!
    @IBOutlet weak var Sege: UISegmentedControl!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    var disHour:String = ""
    var disMin:String = ""
    var disSec:String = ""
    
    @IBAction func segAction(_ sender: Any) {
        switch Sege.selectedSegmentIndex
        {
        case 0:
            openBool = true
            closeBool = false
            dayLabel.text = "REMAINING UNTIL SHIFT END"
            next4pm = calendar.nextDate(after: now, matching: components4pm, matchingPolicy: .nextTime)!
            diff4pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next4pm)
            
            
            disHour = diff4pm.hour!.description
            disMin = diff4pm.minute!.description
            disSec = diff4pm.second!.description
            
            hourLabel.text = diff4pm.hour?.description
            minLabel.text = diff4pm.minute?.description
            secLabel.text = diff4pm.second?.description
            
            if(disHour.count == 1){
                zeroHour.text = "0"
            }
            if(disMin.count == 1){
                zeroMin.text = "0"
            }
            if(disSec.count == 1){
                zeroSec.text = "0"
            }
            
            
        case 1:
            closeBool = true
            openBool = false
            dayLabel.text = "REMAINING UNTIL CLOSE"
            
            zeroHour.text = ""
            zeroMin.text = ""
            zeroSec.text = ""
            
            if(index == 6 || index == 7)
            {
                next11pm = calendar.nextDate(after: now, matching: components11pm, matchingPolicy: .nextTime)!
                diff11pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next11pm)
                
                
                disHour = diff11pm.hour!.description
                disMin = diff11pm.minute!.description
                disSec = diff11pm.second!.description
                
                hourLabel.text = diff11pm.hour?.description
                minLabel.text = diff11pm.minute?.description
                secLabel.text = diff11pm.second?.description
                
                if(disHour.count == 1){
                    zeroHour.text = "0"
                }
                if(disMin.count == 1){
                    zeroMin.text = "0"
                }
                if(disSec.count == 1){
                    zeroSec.text = "0"
                }
                
            }else
            {
                next10pm = calendar.nextDate(after: now, matching: components10pm, matchingPolicy: .nextTime)!
                diff10pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next10pm)
                
                
                disHour = diff10pm.hour!.description
                disMin = diff10pm.minute!.description
                disSec = diff10pm.second!.description
                
                hourLabel.text = diff10pm.hour?.description
                minLabel.text = diff10pm.minute?.description
                secLabel.text = diff10pm.second?.description
                
                if(disHour.count == 1){
                    zeroHour.text = "0"
                }
                if(disMin.count == 1){
                    zeroMin.text = "0"
                }
                if(disSec.count == 1){
                    zeroSec.text = "0"
                }
            }
        default:
            break
        }
    }
    
    
    
    @objc func runTimedCode() {
        
        zeroHour.text = ""
        zeroMin.text = ""
        zeroSec.text = ""
        
        now = Date()
        
        
        if(openBool == true){
            dayLabel.text = "REMAINING UNTIL SHIFT END"
        next4pm = calendar.nextDate(after: now, matching: components4pm, matchingPolicy: .nextTime)!
        diff4pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next4pm)
        
        
        disHour = diff4pm.hour!.description
        disMin = diff4pm.minute!.description
        disSec = diff4pm.second!.description
        
        hourLabel.text = diff4pm.hour?.description
        minLabel.text = diff4pm.minute?.description
        secLabel.text = diff4pm.second?.description
            
            if(disHour.count == 1){
                zeroHour.text = "0"
            }
            if(disMin.count == 1){
                zeroMin.text = "0"
            }
            if(disSec.count == 1){
                zeroSec.text = "0"
            }
        
        }
        
        if(closeBool == true){
            
            
            
            dayLabel.text = "REMAINING UNTIL CLOSE"
            
            
            if(index == 6 || index == 7)
            {
                next11pm = calendar.nextDate(after: now, matching: components11pm, matchingPolicy: .nextTime)!
                diff11pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next11pm)
                
                
                disHour = diff11pm.hour!.description
                disMin = diff11pm.minute!.description
                disSec = diff11pm.second!.description
                
                hourLabel.text = diff11pm.hour?.description
                minLabel.text = diff11pm.minute?.description
                secLabel.text = diff11pm.second?.description
                
                if(disHour.count == 1){
                    zeroHour.text = "0"
                }
                if(disMin.count == 1){
                    zeroMin.text = "0"
                }
                if(disSec.count == 1){
                    zeroSec.text = "0"
                }
                
            }else
            {
                next10pm = calendar.nextDate(after: now, matching: components10pm, matchingPolicy: .nextTime)!
                diff10pm = calendar.dateComponents([.hour, .minute, .second], from: now, to: next10pm)
                
                
                disHour = diff10pm.hour!.description
                disMin = diff10pm.minute!.description
                disSec = diff10pm.second!.description
                
                hourLabel.text = diff10pm.hour?.description
                minLabel.text = diff10pm.minute?.description
                secLabel.text = diff10pm.second?.description
                
                if(disHour.count == 1){
                    zeroHour.text = "0"
                }
                if(disMin.count == 1){
                    zeroMin.text = "0"
                }
                if(disSec.count == 1){
                    zeroSec.text = "0"
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        secondTick = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

