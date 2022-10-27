//
//  ViewController.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2022/10/27.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    let realm = try! Realm()
    
    var gumiData: Results<GumiData>?
    
    var timerCount = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer) , userInfo: nil, repeats: true)
        sender.isEnabled = false
    }
    
    @IBAction func endPressed(_ sender: UIButton) {
        startButton.isEnabled = true
        
        let alert = UIAlertController(title: "맛있는 마이구미 획득!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "획득하기", style: .default) { action in
            
            let newGumiData = GumiData()
            newGumiData.date = "22년 10월 26일"
            newGumiData.gumiCount = self.timerCount
            
            self.save(gumiData: newGumiData)
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
    
    func save(gumiData: GumiData) {
        do {
            try realm.write {
                realm.add(gumiData)
            }
        } catch {
            print("Error saving context, \(error)")
        }
        
        
    }
    
}

