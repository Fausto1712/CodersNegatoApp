//
//  SectorView.swift
//  MoodAppDemo
//
//  Created by Pietro Carnevale on 20/10/23.
//

import SwiftUI

struct SectorView: View {
    
    @State var taskViewModel = TaskViewModel()
    @State var sectorName: String
    @State private var isModalPresented = false
    @State private var newAnimalName = ""
    
    @AppStorage("doneSportTasks") var sportTasks = 29
    @AppStorage("doneHealthTasks") var healthTasks = 15
    @AppStorage("doneFreeTimeTasks") var freeTasks = 7
    @AppStorage("doneWorkTasks") var workTasks = 19
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack(spacing:-15){
                    if (sectorName == "Sport"){
                        progressBar(taskDone: $sportTasks, isModalPresented: $isModalPresented)
                        AnimalFarmView(newAnimalName: $newAnimalName)
                            .frame(height: 250)
                    } else if (sectorName == "Health"){
                        progressBar(taskDone: $healthTasks, isModalPresented: $isModalPresented)
                        AnimalFarmView(newAnimalName: $newAnimalName)
                            .frame(height: 250)
                    } else if (sectorName == "Free Time"){
                        progressBar(taskDone: $freeTasks, isModalPresented: $isModalPresented)
                        AnimalFarmView(newAnimalName: $newAnimalName)
                            .frame(height: 250)
                    } else if (sectorName == "Work"){
                        progressBar(taskDone: $workTasks, isModalPresented: $isModalPresented)
                        AnimalFarmView(newAnimalName: $newAnimalName)
                            .frame(height: 250)
                    }
                    ScrollView(.vertical){
                        VStack(spacing:15){
                            ForEach((0 ... taskViewModel.tasks.count-1), id: \.self) { i in
                                if taskViewModel.tasks[i].sector == sectorName {
                                    TaskView(task: taskViewModel.tasks[i])
                                }
                            }
                        }
                    }
                    .padding()
                    .navigationTitle(sectorName)
                }
                if isModalPresented {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isModalPresented = false
                        }
                    if (sectorName == "Sport"){
                        PuzzleView(newAnimalName: $newAnimalName, puzzleSector: "Sport", dismiss: {isModalPresented = false})
                    } else if (sectorName == "Health"){
                        PuzzleView(newAnimalName: $newAnimalName, puzzleSector: "Health", dismiss: {isModalPresented = false})
                    } else if (sectorName == "Free Time"){
                        PuzzleView(newAnimalName: $newAnimalName, puzzleSector: "Free Time", dismiss: {isModalPresented = false})
                    } else if (sectorName == "Work"){
                        PuzzleView(newAnimalName: $newAnimalName, puzzleSector: "Work", dismiss: {isModalPresented = false})
                    }
                }
            }
        }
    }
}

#Preview {
    SectorView(sectorName: "Sport")
}

struct progressBar: View {
    @Binding var taskDone: Int
    @Binding var isModalPresented: Bool
    
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
                        .foregroundColor(taskDone == 30 ? .blue : .black)
                        .onTapGesture {
                            isModalPresented.toggle()
                        }
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
