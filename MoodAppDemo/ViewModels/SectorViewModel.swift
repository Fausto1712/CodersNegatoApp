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
        Sector(name: "Sport", color: .orange, desc: "Walk, Run, Swim"),
        Sector(name: "Health", color: .green, desc: "Eating, Sleep, Meditation"),
        Sector(name: "Free Time", color: .cyan, desc: "Hobbies, Passions, Social activities"),
        Sector(name: "Work", color: .purple, desc: "Job, Study, Learning, Research")
    ]
}
