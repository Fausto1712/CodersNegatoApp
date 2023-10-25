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
    var sport: Int
    var health: Int
    var freeTime: Int
    var work: Int
    
}
