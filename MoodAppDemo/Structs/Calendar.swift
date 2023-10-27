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
        self.dayCounter = 33
        self.daysOfTheMonth = [
            Day(sport: 1, health: 3, freeTime: 3, work: 3),
            Day(sport: 2, health: 3, freeTime: 2, work: 0),
            Day(sport: 3, health: 3, freeTime: 3, work: 3),
            Day(sport: 4, health: 2, freeTime: 2, work: 0),
            Day(sport: 5, health: 3, freeTime: 3, work: 3),
            Day(sport: 6, health: 1, freeTime: 2, work: 0),
            Day(sport: 7, health: 3, freeTime: 3, work: 3),
            Day(sport: 8, health: 0, freeTime: 2, work: 3),
            Day(sport: 9, health: 3, freeTime: 3, work: 3),
            Day(sport: 10, health: 3, freeTime: 3, work: 1),
            Day(sport: 11, health: 1, freeTime: 2, work: 3),
            Day(sport: 12, health: 3, freeTime: 3, work: 3),
            Day(sport: 13, health: 3, freeTime: 2, work: 1),
            Day(sport: 14, health: 2, freeTime: 1, work: 3),
            Day(sport: 15, health: 3, freeTime: 2, work: 0),
            Day(sport: 16, health: 1, freeTime: 0, work: 3),
            Day(sport: 17, health: 3, freeTime: 3, work: 3),
            Day(sport: 18, health: 2, freeTime: 1, work: 1),
            Day(sport: 19, health: 3, freeTime: 3, work: 3),
            Day(sport: 20, health: 0, freeTime: 0, work: 1),
            Day(sport: 21, health: 1, freeTime: 3, work: 3),
            Day(sport: 22, health: 3, freeTime: 3, work: 3),
            Day(sport: 23, health: 3, freeTime: 2, work: 2),
            Day(sport: 24, health: 1, freeTime: 3, work: 3),
            Day(sport: 25, health: 3, freeTime: 1, work: 2),
            Day(sport: 26, health: 3, freeTime: 3, work: 3),
            Day(sport: 27, health: 2, freeTime: 2, work: 2),
            Day(sport: 28, health: 3, freeTime: 3, work: 3),
            Day(sport: 29, health: 3, freeTime: 3, work: 3),
            Day(sport: 30, health: 0, freeTime: 2, work: 2)
        ]
    }
}

