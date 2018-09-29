//
//  Room.swift
//  BookerApp
//
//  Created by Ka ka Tam on 29/09/2018.
//  Copyright © 2018 Ka ka Tam. All rights reserved.
//

import Foundation

class Room {
    var name : String
    var capacity: Int
    var isAvailable: Bool = true
    var bookedBy: String = ""
    
    init(name:String, capacity:Int, bookedBy:String) {
        self.name = name
        self.capacity = capacity
        self.bookedBy = bookedBy
        if bookedBy == "" {
            self.isAvailable = false
        } else {
            self.isAvailable = true
        }
    }
}
