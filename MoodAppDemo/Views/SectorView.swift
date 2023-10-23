//
//  SectorView.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 20/10/23.
//

import SwiftUI

struct SectorView: View {
    
    @State var sector: Sector
    
    var body: some View {
        
        NavigationStack{
            AnimalFarmView()
            ScrollView(.vertical){
                VStack(spacing:15){
                    ForEach(sector.tasks) { task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.name)
                                    .font(.title2)
                                    .bold()
                                Text(task.description)
                            }
                            .padding(10)
                            Spacer()
                            if(task.done) {
                                Image(systemName: "checkmark.square").onTapGesture {
                                    //task.swapDone()
                                }
                            } else {
                                Image(systemName: "square")
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 6)
                    }
                }
            }
            .padding(10)
            .background()
            .navigationTitle(sector.name)
        }
    }
}

#Preview {
    SectorView(sector: Sector(name: "Sports", color: .orange, desc: "Walk, Run, Swim", tasks:[
        Task(name: "Walk 30 minutes", description: "Walk at least for 30 minutes! Time for some fresh air 🚶🏻‍♂️"),
        Task(name: "Run 10 minutes", description: "Run at least for 10 minutes! It's time to sweat 🏃🏻‍♂️"),
        Task(name: "Swim 30 minutes", description: "Swim until 30 minutes! Time to feel the water")
    ]))
}
