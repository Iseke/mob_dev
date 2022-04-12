//
//  ViewController.swift
//  Pomodoro
//
//  Created by Islam Abdukarimov on 11.04.2022.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var timer = Timer()
    var isTimerStarted = false
    var isBreakStarted = false
    var time = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        cancelButton.isEnabled = true
        cancelButton.alpha = 1.0
        
        if !isTimerStarted {
            
            startTimer()
            isTimerStarted = true
             
            startButton.setTitle("Пауза", for: .normal)
            startButton.setTitleColor(UIColor.orange, for: .normal)
        }
        else {
            timer.invalidate()
            isTimerStarted = false
            
            startButton.setTitle("Продолжить", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        cancelButton.isEnabled = true
        cancelButton.alpha = 0.5
        
        startButton.setTitle("Старт", for: .normal )
        startButton.setTitleColor(UIColor.green, for: .normal )
        
        timer.invalidate()
        time = 7
        isTimerStarted = false
        timeLabel.text = "00:07"
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if time < 1 {
            isTimerStarted = false
            
            timeLabel.text = "00:05"
            time = 5
            isBreakStarted = true
        }
        else {
            time -= 1
            timeLabel.text = formatTime()
        }
    }
    
    func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
}

