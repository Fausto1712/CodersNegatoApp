//
//  DailyView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import SwiftUI
import Charts

struct SummaryView: View {
    var sectorView = SectorViewModel()
    @State var filter = "Daily"
    
    var body: some View {
        NavigationStack {
            VStack {
                Menu {
                    Picker(selection: $filter) {
                        Text("Daily").tag("Daily")
                        Text("Weekly").tag("Weekly")
                        Text("Monthly").tag("Monthly")
                    } label: {}
                } label: {
                    Text("\(filter) ✎")
                        .font(.largeTitle)
                }
                Spacer().frame(height: 50)
                if filter == "Daily" {
                    ZStack {
                        ForEach ((0 ... sectorView.sectors.count-1), id: \.self) { i in
                            CircularProgressView(progress: sectorView.sectors[i].updateProgress(), color: sectorView.sectors[i].color)
                                .frame(width: 255 - calculateOffset(numSec: sectorView.sectors.count)*Double(i), height: 255 - calculateOffset(numSec: sectorView.sectors.count)*Double(i))
                            
                        }
                    }
                }
                else if filter == "Weekly" {
                    Chart {
                        ForEach ((0 ... sectorView.sectors.count-1), id: \.self) { i in
                            BarMark(
                                x: .value("Sector", sectorView.sectors[i].name),
                                y: .value("Total Count", sectorView.sectors[i].updateProgress())
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
                                y: .value("Total Count", sectorView.sectors[i].updateProgress())
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
                                    SectorView(sector: sector)
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
    }
}

#Preview {
    SummaryView()
}

func calculateOffset(numSec: Int) -> Double {
    return Double(195 / numSec-1) + 15
}
