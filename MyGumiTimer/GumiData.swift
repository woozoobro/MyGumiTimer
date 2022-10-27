//
//  GumiData.swift
//  MyGumiTimer
//
//  Created by 우주형 on 2022/10/27.
//

import Foundation
import RealmSwift

class GumiData: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var gumiCount: Int = 0
    
}
