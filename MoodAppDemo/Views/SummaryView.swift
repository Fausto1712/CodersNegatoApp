//
//  DailyView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import SwiftUI

struct SummaryView: View {
    var sectorView = SectorViewModel()
    @State var progress: Double = 0
    @State var filter = "Daily"
    var circleSizes:[CGFloat] = [255.0, 190.0, 125.0, 60.0]
    
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
                ZStack {
                    ForEach ((0 ... 3), id: \.self) { i in
                        CircularProgressView(progress: 0.5, color: sectorView.sectors[i].color)
                            .frame(width: circleSizes[i], height: circleSizes[i])
                    }
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
