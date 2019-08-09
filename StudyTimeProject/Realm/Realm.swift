//
//  Realm.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/09.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import Foundation
import RealmSwift

class StudyTime: Object {
    
 /*   func getDate() ->String{
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        let now = Date()
        return f.string(from: now)
    }
 */
        
    @objc dynamic var id = 0
    
    @objc dynamic var time:Int = 0
    
    @objc dynamic var date = Date()
    

    
}
