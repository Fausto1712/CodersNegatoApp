//
//  Day.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 24/10/23.
//

import Foundation

final class Day : Identifiable {
    
    var id: UUID = UUID()
    var date: Date
    var sport: Int = 0
    var health: Int = 0
    var freeTime: Int = 0
    var work: Int = 0
    
    init(id: UUID, date: Date, sport: Int, health: Int, freeTime: Int, work: Int) {
        self.id = id
        self.date = date
        self.sport = sport
        self.health = health
        self.freeTime = freeTime
        self.work = work
    }
    
}
