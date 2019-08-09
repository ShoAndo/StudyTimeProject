//
//  TimeViewController.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/07.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import LTMorphingLabel
import RealmSwift

class TimeViewController: UIViewController {
    
   
    
    @IBOutlet weak var timeLabel: LTMorphingLabel!
    var timer : Timer?
    var duration = 0
    let settingKey = "TimerValue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        _ = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        timeLabel.morphingEffect = .evaporate

        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey: 60])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        duration = 0
        _ = displayUpdate()
    }
    
    func displayUpdate() -> Int{
        let settings = UserDefaults.standard
        
        var timerValue = settings.integer(forKey: settingKey)
        timerValue *= 60
        
        let remainTime = timerValue - duration
        
        if remainTime >= 60{
            let minute = remainTime / 60
            let second = remainTime % 60
            
            timeLabel.text = "\(minute):\(second)"
            
            return minute
            
            
        }else{
            timeLabel.text = "\(remainTime)"
            return remainTime
        }
        
        
    }
    
    @objc func timerStop(_ timer: Timer){
        
        duration += 1
        print(duration)
        
        if displayUpdate() <= 0{
            
            timer.invalidate()
            createNewStudyTime(duration)
            
            duration = 0
            
            self.timer = nil
        }
    }
    
    @IBAction func didClickStartButton(_ sender: Any) {
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                return
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerStop(_:)), userInfo: nil, repeats: true)
    }
    

    @IBAction func didClickStopButton(_ sender: Any) {
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                nowTimer.invalidate()
                
                createNewStudyTime(duration)
                
            }
        }
        
    }
    
    
    @IBAction func didClickSettingButton(_ sender: Any) {
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                nowTimer.invalidate()
                
                createNewStudyTime(duration)
            }
        }
        
        performSegue(withIdentifier: "toSetting", sender: nil)
    }
    
    func getMaxId() ->Int?{
        let realm = try! Realm()
        let id = realm.objects(StudyTime.self).max(ofProperty: "id") as Int?
        
        if id == nil{
            return 1
        }else{
            return id! + 1
        }
        
    }
    
    func createNewStudyTime(_ time: Int){
        let realm = try! Realm()
        
        let oneStudyTime = StudyTime()
        
        let id = getMaxId()
//        let getDate = oneStudyTime.getDate()
        
        oneStudyTime.id = id!
        oneStudyTime.time = time
        oneStudyTime.date = Date()
        
        try! realm.write {
            realm.add(oneStudyTime)
        }
      
    }
    
    
    

}
