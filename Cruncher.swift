//
//  Cruncher.swift
//  Calculates time difference and pay amount 
//  Time to leave
//
//  Created by Raffer Li on 12/14/19.
//  Copyright © 2019 Raffer Li. All rights reserved.
//

import Foundation
import UIKit

class Cruncher: UIViewController {

    @IBOutlet weak var inSecLabel: UILabel!
    @IBOutlet weak var inMinuteLabel: UILabel!
    @IBOutlet weak var inHourLabel: UILabel!
    @IBOutlet weak var zeroHour: UILabel!
    @IBOutlet weak var zeroMin: UILabel!
    @IBOutlet weak var zeroSec: UILabel!
    @IBOutlet weak var payRate: UIButton!
    
    
    var isNine = false
    var rate : Double = 8.5
    
    @IBAction func rateTapped(_ sender: Any) {
        
        if (isNine == false)
        {
            payRate.setTitle("Calculating fpr $9.00/hour Tap here to change", for: .normal)
            rate = 9
            isNine = true
        }
        else
        {
            payRate.setTitle("Calculating for $8.50/hour Tap here to change", for: .normal)
            rate = 8.5
            isNine = false
        }
        
    }
    
    
    @IBOutlet weak var moneyEarned: UILabel!
    
    var amountEarned : Double = 0
    
    var disHour:String? = ""
    var disMin:String = ""
    var disSec:String = ""
    
    var clockIn:String?
    
    
    @objc func runTimedCode()
    {

            zeroHour.text = ""
            zeroMin.text = ""
            zeroSec.text = ""
        
            crunch(rate: rate)
    }
    
    override func viewDidLoad() {
        
        secondTick = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        crunch(rate: rate)
        
        super.viewDidLoad()
        
    }

    func crunch(rate: Double) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        let myString = formatter.string(from: Date())

        let yourDate = formatter.date(from: myString)
        
        let date2 = formatter.date(from: clockIn!)!
        
        let elapsedTime = yourDate!.timeIntervalSince(date2)
        
        diffclockedTime = calendar.dateComponents([.hour, .minute, .second], from: date2, to: yourDate!)
        
        inHourLabel.text = diffclockedTime.hour?.description
        inMinuteLabel.text = diffclockedTime.minute?.description
        inSecLabel.text = diffclockedTime.second?.description
        
        if(inHourLabel.text!.count == 1){
            zeroHour.text = "0"
        }
        if(inMinuteLabel.text!.count == 1){
            zeroMin.text = "0"
        }
        if(inSecLabel.text!.count == 1){
            zeroSec.text = "0"
        }
        
        amountEarned = elapsedTime*((rate/60)/60)
        
        if (amountEarned < 100 )
        {
            moneyEarned.text = "$" + String(format: "%.3f", amountEarned)
        }
            
        else
        {
            moneyEarned.text = "$" + String(format: "%.2f", amountEarned)
        }

    }
}
