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
        Sector(name: "Sport", color: .orange, desc: "Walk, Run, Swim", tasks:[]),
        Sector(name: "Health", color: .green, desc: "Eating, Sleep, Meditation", tasks:[]),
        Sector(name: "Eat", color: .cyan, desc: "Calories, Water, ...", tasks:[])
    ]
}
