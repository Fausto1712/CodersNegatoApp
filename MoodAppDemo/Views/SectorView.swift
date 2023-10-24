//
//  SectorView.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 20/10/23.
//

import SwiftUI

struct SectorView: View {
    
    @State var sector: Sector
    @State var progress: CGFloat = 0.5
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing:-15){
                progressBar()
                AnimalFarmView()
                    .frame(height: 250)
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
                .padding()
                .navigationTitle(sector.name)
            }
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

struct progressBar: View {
    
    @State var progress: CGFloat = 1
    @State var taskDone: Int = 15
    
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                HStack{
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: CGFloat((taskDone * 100)/30)/100 * geometry.size.width-30, height: 10)
                        .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                        .offset(x:15,y: 25)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 6)
                    
                    Spacer()
                }
                HStack{
                    VStack{
                        Text("\(Int((taskDone * 100)/30 ))%")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                    Image(systemName: "puzzlepiece")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                }
                .offset(y:-10)
                .padding()
            }
        }
        .background(Color.white)
        .frame(maxWidth: .infinity,maxHeight: 90)
        .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 8)
        
    }
}
