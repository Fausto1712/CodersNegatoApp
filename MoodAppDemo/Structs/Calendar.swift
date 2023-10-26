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
        self.dayCounter = 0
        self.daysOfTheMonth = [
            Day(date: DateComponents(year: 2023, month: 10, day: 1).date!, sport: 2, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 2).date!, sport: 1, health: 3, freeTime: 2, work: 0),
            Day(date: DateComponents(year: 2023, month: 10, day: 3).date!, sport: 0, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 4).date!, sport: 3, health: 2, freeTime: 2, work: 0),
            Day(date: DateComponents(year: 2023, month: 10, day: 5).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 6).date!, sport: 1, health: 1, freeTime: 2, work: 0),
            Day(date: DateComponents(year: 2023, month: 10, day: 7).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 8).date!, sport: 2, health: 0, freeTime: 2, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 9).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 10).date!, sport: 3, health: 3, freeTime: 3, work: 1),
            Day(date: DateComponents(year: 2023, month: 10, day: 11).date!, sport: 1, health: 1, freeTime: 2, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 12).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 13).date!, sport: 2, health: 3, freeTime: 2, work: 1),
            Day(date: DateComponents(year: 2023, month: 10, day: 14).date!, sport: 3, health: 2, freeTime: 1, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 15).date!, sport: 2, health: 3, freeTime: 2, work: 0),
            Day(date: DateComponents(year: 2023, month: 10, day: 16).date!, sport: 2, health: 1, freeTime: 0, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 17).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 18).date!, sport: 1, health: 2, freeTime: 1, work: 1),
            Day(date: DateComponents(year: 2023, month: 10, day: 19).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 20).date!, sport: 0, health: 0, freeTime: 0, work: 1),
            Day(date: DateComponents(year: 2023, month: 10, day: 21).date!, sport: 3, health: 1, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 22).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 23).date!, sport: 1, health: 3, freeTime: 2, work: 2),
            Day(date: DateComponents(year: 2023, month: 10, day: 24).date!, sport: 3, health: 1, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 25).date!, sport: 3, health: 3, freeTime: 1, work: 2),
            Day(date: DateComponents(year: 2023, month: 10, day: 26).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 27).date!, sport: 2, health: 2, freeTime: 2, work: 2),
            Day(date: DateComponents(year: 2023, month: 10, day: 28).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 29).date!, sport: 3, health: 3, freeTime: 3, work: 3),
            Day(date: DateComponents(year: 2023, month: 10, day: 30).date!, sport: 2, health: 0, freeTime: 2, work: 2)
        ]
    }
}

