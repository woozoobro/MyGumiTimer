//
//  ViewController.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2022/10/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var timerCount = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer) , userInfo: nil, repeats: true)
        sender.isEnabled = false
    }
    
    @IBAction func endPressed(_ sender: UIButton) {
        startButton.isEnabled = true
        
        let alert = UIAlertController(title: "맛있는 마이구미 획득!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "획득하기", style: .default) { action in
            print("Success!")
        }
        alert.addAction(action)
        
        
        timer?.invalidate()
        if timerCount > 4 {
            present(alert, animated: true, completion: nil)
        }
        timerCount = 0
        timeLabel.text = "0"
    }
    
    @objc func fireTimer() {
        timerCount += 1
        timeLabel.text = "\(timerCount)"
    }
    
}

