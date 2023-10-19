//
//  Task.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import Foundation

struct Task : Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var description: String
    var done: Bool = false
}
