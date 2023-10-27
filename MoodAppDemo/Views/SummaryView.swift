//
//  DailyView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import SwiftUI
import Charts
import SwiftData

struct SummaryView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Day.sport) private var days: [Day]
    
    var sectorView = SectorViewModel()
    var taskViewModel = TaskViewModel()
    @State var filter = "Daily"
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filter", selection: $filter) {
                    Text("Daily").tag("Daily")
                    Text("Weekly").tag("Weekly")
                    Text("Monthly").tag("Monthly")
                }
                .pickerStyle(.segmented)
                .frame(width: 300)
                Spacer().frame(height: 50)
                if filter == "Daily" {
                    ZStack {
                        CircularProgressView(progress: Double(days[1].sport)/3, color: sectorView.sectors[0].color)
                            .frame(width: 255, height: 255)
                        CircularProgressView(progress: Double(days[1].health)/3, color: sectorView.sectors[1].color)
                            .frame(width: 190, height: 190)
                        CircularProgressView(progress: Double(days[1].freeTime)/3, color: sectorView.sectors[2].color)
                            .frame(width: 125, height: 125)
                        CircularProgressView(progress: Double(days[1].work)/3, color: sectorView.sectors[3].color)
                            .frame(width: 60, height: 60)
                        
                    }
                }
                else if filter == "Weekly" {
                    Chart {
                        ForEach ((0 ... sectorView.sectors.count-1), id: \.self) { i in
                            BarMark(
                                x: .value("Sector", sectorView.sectors[i].name),
                                y: .value("Total Count", updateProgress(tasksVM: taskViewModel, sector: sectorView.sectors[i].name))
                            )
                            .foregroundStyle(sectorView.sectors[i].color)
                        }
                    }
                    .chartYAxis(.hidden)
                }
                else if filter == "Monthly" {
                    Chart {
                        ForEach ((0 ... sectorView.sectors.count-1), id: \.self) { i in
                            LineMark(
                                x: .value("Sector", sectorView.sectors[i].name),
                                y: .value("Total Count", updateProgress(tasksVM: taskViewModel, sector: sectorView.sectors[i].name))
                            )
                            .foregroundStyle(sectorView.sectors[i].color)
                        }
                    }
                    .chartYAxis(.hidden)
                }
                Spacer().frame(height: 50)
                List {
                    ForEach (sectorView.sectors) { sector in
                        VStack {
                            HStack {
                                VStack {
                                    Spacer().frame(height: 10)
                                    Text(sector.name)
                                        .font(.system(size: 20))
                                        .foregroundColor(sector.color)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    Text(sector.desc)
                                        .font(.system(size: 11))
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                }
                                NavigationLink {
                                    SectorView(sectorName: sector.name)
                                } label: {
                                    Text("See more")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
                
            }
        }
        .onAppear(perform: addCalendar)
    }
    
    private func addCalendar() -> Void {
        if (days.isEmpty) {
            for j in 1...30 {
                let day = Day(sport: j, health: j+1, freeTime: j+3, work: 2*j)
                modelContext.insert(day)
            }
        }
        /*do {
           try modelContext.delete(model: Day.self)
        } catch {
            print("Error")
        }*/
    }
}


#Preview {
    SummaryView()
        .modelContainer(for: Day.self, inMemory: true)
}

func calculateOffset(numSec: Int) -> Double {
    return Double(195 / numSec-1) + 15
}

func updateProgress(tasksVM: TaskViewModel, sector: String) -> Double {
    var tasksDone = 0
    var totalTasks = 0
    for i in 0 ... tasksVM.tasks.count-1 {
        if tasksVM.tasks[i].sector == sector {
            totalTasks += 1
            if tasksVM.tasks[i].done {
                tasksDone += 1
            }
        }
    }
    return Double(tasksDone) / Double(totalTasks)
}
