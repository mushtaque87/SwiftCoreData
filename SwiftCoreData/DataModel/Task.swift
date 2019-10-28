//
//  Task.swift
//  SwiftCoreData
//
//  Created by Mushtaque Ahmed on 10/28/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import Foundation

struct Task {
    let title : String
    let type : String
    let creationDate : Date
    let endDate : Date
    var priority : Int?
    
    init(_ title:String , _ type:String , creationDate : Date , endDate: Date ,  priority : Int) {
        self.title = title
        self.type = type
        self.creationDate = creationDate
        self.endDate = endDate
        self.priority = priority
    }
    
}
