//
//  Day.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 24/10/23.
//

import Foundation

struct Day : Identifiable {
    
    var id: UUID = UUID()
    var date: Date
    var sport: Int = 0
    var health: Int = 0
    var freeTime: Int = 0
    var work: Int = 0
    
}
