//
//  Calendar.swift
//  MoodAppDemo
//
//  Created by Fausto Pinto Cabrera on 25/10/23.
//

import Foundation
import SwiftData

@Model
final class Calendar {
    
    var daysOfTheMonth: [Day]
    var dayCounter: Int
    
    init() {
        self.dayCounter = 5
        self.daysOfTheMonth = [
            Day(sport: 2, health: 3, freeTime: 3, work: 3),
            Day(sport: 1, health: 3, freeTime: 2, work: 0),
            Day(sport: 0, health: 3, freeTime: 3, work: 3),
            Day(sport: 3, health: 2, freeTime: 2, work: 0),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 1, health: 1, freeTime: 2, work: 0),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 2, health: 0, freeTime: 2, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 1),
            Day(sport: 1, health: 1, freeTime: 2, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 2, health: 3, freeTime: 2, work: 1),
            Day(sport: 3, health: 2, freeTime: 1, work: 3),
            Day(sport: 2, health: 3, freeTime: 2, work: 0),
            Day(sport: 2, health: 1, freeTime: 0, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 1, health: 2, freeTime: 1, work: 1),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 0, health: 0, freeTime: 0, work: 1),
            Day(sport: 3, health: 1, freeTime: 3, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 1, health: 3, freeTime: 2, work: 2),
            Day(sport: 3, health: 1, freeTime: 3, work: 3),
            Day(sport: 3, health: 3, freeTime: 1, work: 2),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 2, health: 2, freeTime: 2, work: 2),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 2, health: 0, freeTime: 2, work: 2)
        ]
    }
}

