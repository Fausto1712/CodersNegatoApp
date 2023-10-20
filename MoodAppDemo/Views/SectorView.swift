//
//  SectorView.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 20/10/23.
//

import SwiftUI

struct SectorView: View {
    
    var sector: Sector
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(sector.tasks) { task in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.name)
                                .font(.title2)
                                .bold()
                            Text(task.description)
                        }
                        .padding(10)
                        Image(systemName: "checkmark")
                    }
                    
                }
            }
            .navigationTitle("Learners")
        }
    }
}

#Preview {
    SectorView(sector: Sector(name: "Sport", color: .orange, desc: "Walk, Run, Swim", tasks:[
        Task(name: "Walk 30 minutes", description: "Walk at least for 30 minutes! Time for some fresh air 🚶🏻‍♂️"),
        Task(name: "Run 10 minutes", description: "Run at least for 10 minutes! It's time to sweat 🏃🏻‍♂️")
    ]))
}
