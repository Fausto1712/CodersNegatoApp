//
//  TaskViewModel.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 26/10/23.
//

import Foundation

class TaskViewModel {
    
    var tasks: [Task] = [
            Task(name: "Walk 30 minutes", description: "Walk at least for 30 minutes! Time for some fresh air 🚶🏻‍♂️", done: true, sector: "Sport"),
            Task(name: "Run 10 minutes", description: "Run at least for 10 minutes! It's time to sweat 🏃🏻‍♂️", done: false, sector: "Sport"),
            Task(name: "Swim 40 minutes", description: "Swim for at least 40 minutes! It's time to get cool off 🏊‍♂️", done: false, sector: "Sport"),
            
            Task(name: "Open the app", description: "Happy to see you today!!! ☺️", done: true, sector: "Health"),
            Task(name: "Eat 3 times", description: "Eat 3 meals today! Do you feel full? 🍕", done: false, sector: "Health"),
            Task(name: "Sleep 8 hours", description: "Have you slept at least 8 hours tonight? 😴", done: true, sector: "Health"),
            
            Task(name: "Play videogames 2 hours", description: "Don't play videogames for more than 2 hours. It's good to play, but remember to focus also on your work 🎮", done: false, sector: "Free Time"),
            Task(name: "Take a picture", description: "Take a picture of something cool; it could be yourself, some relatives or friends, some food or an amazing landscape 📸", done: false, sector: "Free Time"),
            Task(name: "Listen to music", description: "Take a few minutes to enjoy your favorite tunes 🎼", done: false, sector: "Free Time"),
            
            Task(name: "Study 2 hours", description: "Study at least for 2 hours today! Time to learn new cool things 📚", done: false, sector: "Work"),
            Task(name: "Learn how to code", description: "Exercise your coding skills today! print(\"Hello World!\") 👨🏻‍💻", done: false, sector: "Work"),
            Task(name: "Clean the house", description: "Take a few minutes to mop and wipe the counters, Make them shinny 🧹", done: false, sector: "Work")
        ]
}
