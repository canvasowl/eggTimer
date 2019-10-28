//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    let eggTimes = [
        // in seconds
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    var remainingSeconds = 0
    var timer = Timer()
    
    // handles the eggs being pressed
    @IBAction func eggPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        remainingSeconds = eggTimes[hardness]!
        startTimer(seconds: eggTimes[hardness]!)
    }
    
    // start the timer
    fileprivate func startTimer(seconds: Int) -> Timer {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        
        return timer
    }
    
    // update the timer time
    @objc func timerCallback(){
        if remainingSeconds > 0 {
            print("\(remainingSeconds) seconds.")
            remainingSeconds -= 1
        }else{
            timer.invalidate()
            mainLabel.text = "DONE!"
        }
    }
    
}
