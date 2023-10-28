//
//  ContentView.swift
//  A1
//
//  Created by Pietro Carnevale on 18/10/23.
//

import SwiftUI
import Combine

struct PuzzleView: View {
    @AppStorage("doneSportTasks") var sportTasks = 29
    @AppStorage("doneHealthTasks") var healthTasks = 15
    @AppStorage("doneFreeTimeTasks") var freeTasks = 7
    @AppStorage("doneWorkTasks") var workTasks = 19
    
    @Binding var newAnimalName: String
    @State private var textFieldValue = ""
    var puzzleSector: String
    
    var check: [Bool] = [true, true, true, true, true, true, true, true, true, true, true, true, false, true, true, false, true, true, true, true, true, false, false, true, true, false, true, true, true, false]
    var trueCounter: Int = 0
    var dismiss: () -> Void
    
    var body: some View {
        ZStack{
            VStack{
                Text("Complete your daily tasks to unlock a new piece!")
                    .font(.title3)
                    .bold()
                    .padding()
                ZStack {
                    Image("AAD")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                        ForEach(1..<7) { row in
                            GridRow {
                                ForEach(1..<6) { column in
                                    if(check[5*(row - 1) + column - 1]) {
                                        Image("")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } else {
                                        Image("locked")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                }
                            }
                        }
                    }
                }
                .border(.black)
                .padding()
                TextField("Enter new name", text: $textFieldValue)
                                    .padding()
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("CLAIM", action: {
                    if (puzzleSector == "Sport" && sportTasks == 30){
                        sportTasks = 0
                        newAnimalName = textFieldValue
                    } else if (puzzleSector == "Health" && healthTasks == 30){
                        healthTasks = 0
                        newAnimalName = textFieldValue
                    } else if (puzzleSector == "Free Time" && freeTasks == 30){
                        freeTasks = 0
                        newAnimalName = textFieldValue
                    } else if (puzzleSector == "Work" && workTasks == 30){
                        workTasks = 0
                        newAnimalName = textFieldValue
                    }
                    dismiss()
                })
                .disabled(trueCounter != 0)
                .foregroundStyle(Color.blue)
                .padding()
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .frame(width: 350, height: 350)
        }
        .padding()
    }
}
