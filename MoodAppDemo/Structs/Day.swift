//
//  Day.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 24/10/23.
//

import Foundation
import SwiftData

@Model
final class Day : Identifiable {
    
    var id: UUID = UUID()
    var sport: Int
    var health: Int
    var freeTime: Int
    var work: Int
    
    init(sport: Int, health: Int, freeTime: Int, work: Int) {
        self.id = UUID()
        self.sport = sport
        self.health = health
        self.freeTime = freeTime
        self.work = work
    }
    
}
