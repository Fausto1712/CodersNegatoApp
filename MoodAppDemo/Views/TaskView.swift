//
//  TaskView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 27/10/23.
//

import SwiftUI

struct TaskView: View {
    @AppStorage("doneSportTasks") var sportTasks = 0
    @AppStorage("doneHealthTasks") var healthTasks = 0
    @AppStorage("doneFreeTimeTasks") var freeTasks = 0
    @AppStorage("doneWorkTasks") var workTasks = 0
    
    @State var task: Task
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.title2)
                    .bold()
                Text(task.description)
            }
            .padding(10)
            Spacer()
            Toggle(isOn: $task.done) {
                
            }
            .onChange(of: task.done) {
                let mod = task.done ? 1 : -1
                switch (task.sector) {
                case "Sport" :
                    sportTasks += mod
                    break
                case "Health":
                    healthTasks += mod
                    break
                case "Free Time" :
                    freeTasks += mod
                    break
                case "Work":
                    workTasks += mod
                    break
                default:
                    print("nop")
                }
                print(sportTasks)
                print(healthTasks)
                print(freeTasks)
                print(workTasks)
            }
            .toggleStyle(iOSCheckboxToggleStyle())

        }
        .padding()
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 6)
    }
}

#Preview {
    TaskView(task: Task(name: "Walk 30 minutes", description: "Walk at least for 30 minutes! Time for some fresh air 🚶🏻‍♂️", done: true, sector: "Sport"))
}
