//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var mainLabel: UILabel!
    var player: AVAudioPlayer?
    
    let eggTimes = [
        // in seconds
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
   
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    // handles the eggs being pressed
    @IBAction func eggPressed(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPassed = 0
        mainLabel.text = "Eggs cooking.."
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        totalTime = eggTimes[hardness]!
        startTimer(seconds: eggTimes[hardness]!)
    }
    
    // start the timer
    fileprivate func startTimer(seconds: Int) -> Timer {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        
        return timer
    }
    
    // update the timer time
    @objc func timerCallback(){
        
        if secondsPassed < totalTime {
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            
            progressBar.progress = percentageProgress
        }else{
            timer.invalidate()
            progressBar.progress = 1.0
            mainLabel.text = "DONE!"
            playSound()
        }
    }
    
    // play sound
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}
