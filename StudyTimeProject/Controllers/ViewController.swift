//
//  ViewController.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/07.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController
import RealmSwift


class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)//追加
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func didClickedButton(_ sender: Any) {
        performSegue(withIdentifier: "toStart", sender: nil)
    }
    
}

