//
//  DailyStatsView.swift
//  A1
//
//  Created by Pietro Carnevale on 19/10/23.
//

import SwiftUI
import Charts

struct WeeklyView: View {
    @StateObject var sharedViewModel = SharedViewModel()
    
    var sectors = SectorViewModel()
    var body: some View {
        
        NavigationStack{
            
            Chart {
                ForEach(sectors.sectors) { sector in
                    BarMark(
                        x: .value("Sector", sector.name),
                        y: .value("Total Count", sector.name.count)
                        )
                    .foregroundStyle(sector.color)
                }
            }
            .padding()
            
            List {
                ForEach(sectors.sectors) { sector in
                    
                    NavigationLink {
                        PuzzleView(sharedViewModel: sharedViewModel)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(sector.name)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(sector.color)
                            Text(sector.desc)
                        }
                        .padding()
                    }
                    
                }
            }
            .navigationTitle("Weekly")
        }
        
    }
}

#Preview {
    WeeklyView()
}
