//
//  ReportViewController.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/07.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController
import RealmSwift


class ReportViewController: UIViewController {
   
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalLabel.text = String(getTotalStudyTime())
        todayLabel.text = String(getTodayStudyTime())
    }
    
    func getTodayStudyTime()->Int{
        let realm = try! Realm()
        
        let day = Date()
        
        let startOfDay = Calendar.current.startOfDay(for: day)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 0
        dateComponents.second = 0

        
        let endOfDay =   Calendar.current.nextDate(after: day, matching: dateComponents, matchingPolicy: .nextTime)
        
       
      
        let todayStudyTime:Int = realm.objects(StudyTime.self).filter("date > %@ AND date < %@",startOfDay,endOfDay!).sum(ofProperty: "time")
        
        return todayStudyTime
        

    }
 
    
    func getTotalStudyTime()->Int{
        
        let realm = try! Realm()
        
        let totalStudyTime:Int = realm.objects(StudyTime.self).sum(ofProperty: "time")
        
        return totalStudyTime
    }
 
  
    


}
