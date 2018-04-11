//
//  ViewController.swift
//  Digital Timer
//
//  Created by 김종현 on 2018. 4. 4..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // switch off

      }
      
      
      @IBAction func switchChanged(_ sender: Any) {
            if mySwitch.isOn == true {
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats:  true, block: {
            (myTimer) in
            self.updateTime()
        })
            } else {
                  myTimer.invalidate()
            }
      }
    
    @objc func updateTime() {
        let date =  Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss a"
        timeLabel.text = formatter.string(from: date)
//        timeLabel.text = String(describing: date)
    }

   @IBAction func timerStrat(_ sender: Any) {
        if mySwitch.isOn == true {
            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            // closure 사용
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
                self.updateTime()
            })
            
        } else {
            myTimer.invalidate()
            
        }
    }
}

