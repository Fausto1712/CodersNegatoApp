//
//  SectorView.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 16/10/23.
//

import Foundation

class SectorViewModel
{
    var sectors: [Sector] = [
        Sector(name: "Sport", color: .orange, desc: "Walk, Run, Swim", tasks:[
            Task(name: "Walk 30 minutes", description: "Walk at least for 30 minutes! Time for some fresh air 🚶🏻‍♂️"),
            Task(name: "Run 10 minutes", description: "Run at least for 10 minutes! It's time to sweat 🏃🏻‍♂️")
        ]),
        Sector(name: "Health", color: .green, desc: "Eating, Sleep, Meditation", tasks:[
            Task(name: "Open the app", description: "Happy to see you today!!! ☺️"),
            Task(name: "Eat 3 times", description: "Eat 3 meals today! Do you feel full? 🍕"),
            Task(name: "Sleep 8 hours", description: "Have you slept at least 8 hours tonight? 😴")
        ]),
        Sector(name: "Free Time", color: .cyan, desc: "Hobbies, Passions, Social activities", tasks:[
            Task(name: "Play videogames 2 hours", description: "Don't play videogames for more than 2 hours. It's good to play, but remember to focus also on your work 🎮"),
            Task(name: "Take a picture", description: "Take a picture of something cool; it could be yourself, some relatives or friends, some food or an amazing landscape")
        ]),
        Sector(name: "Work", color: .purple, desc: "Job, Study, Learning, Research", tasks: [
            Task(name: "Study 2 hours", description: "Study at least for 2 hours today! Time to learn new cool things 📚"),
            Task(name: "Learn how to code", description: "Exercise your coding skills today! print(\"Hello World!\") 👨🏻‍💻")
        ])
    ]
}
