//
//  Sector.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 16/10/23.
//

import SwiftUI

struct Sector : Identifiable{
    var id: UUID = UUID()
    var name: String
    var color: Color
    var desc: String
    
    var progress: Double = 0
    
    var tasks: [Task]
    
    mutating func updateProgress() -> Double {
        var tasksDone = 0
        for i in 0 ... tasks.count-1 {
            if tasks[i].done {
                tasksDone += 1
            }
        }
        progress = Double(tasksDone) / Double(tasks.count)
        return progress
    }
}
