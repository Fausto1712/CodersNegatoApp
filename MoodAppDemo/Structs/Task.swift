//
//  Task.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import Foundation

class Task {
    //var id: UUID = UUID()
    
    var name: String
    var description: String
    var done: Bool
    
    init(name: String, description: String, done: Bool = false) {
        self.name = name
        self.description = description
        self.done = done
    }
    
    func swapDone() {
        done = !done
    }
}
