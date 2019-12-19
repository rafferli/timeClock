//
//  Payroll.swift
//  Time to leave
//
//  Created by Raffer Li on 12/14/19.
//  Copyright © 2019 Raffer Li. All rights reserved.
//

import Foundation
import UIKit

class Payroll: UIViewController {

    var inHour : Int = 0
    var inMinute : Int = 0
    
    var passclockin : String = ""
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var returnButton: UIButton!
    
    @IBAction func setDate(_ sender: Any) {

        self.performSegue(withIdentifier: "passClock", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "passClock"){
            
            let clockindateFormatter = DateFormatter()
            
            clockindateFormatter.dateFormat = "HH:mm"
            
            let clockIn = clockindateFormatter.string(from: timePicker.date) + ":00"
            
            let crunchVC = segue.destination as! Cruncher
            crunchVC.clockIn = clockIn
            
        }
    }
    
}



