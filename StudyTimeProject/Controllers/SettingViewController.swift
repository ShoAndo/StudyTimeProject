//
//  SettingViewController.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/08.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
    
    
    
    @IBOutlet weak var timerPicker: UIPickerView!
    
    let valueArray: [Int] = [10,20,30,60,90,120,150,180]
    
    let settingKey = "TimerValue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.delegate = self
        timerPicker.dataSource = self

        let setting = UserDefaults.standard
        
        let timerValue = setting.integer(forKey: settingKey)
        
        for row in 0..<valueArray.count{
            if valueArray[row] == timerValue{
                timerPicker.selectRow(row, inComponent:0, animated: true)
                
            }
        }
        
    }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return valueArray.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(valueArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let setting = UserDefaults.standard
        setting.setValue(valueArray[row], forKey: settingKey)
        setting.synchronize()
    }
        
    @IBAction func didClickButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
       
    
    

    
}
