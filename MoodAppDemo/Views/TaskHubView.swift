//
//  TaskHubView.swift
//  ProjectTest
//
//  Created by Danilo Luongo on 18/10/23.
//

import SwiftUI

struct TaskHubView: View {
    var sectorView = SectorViewModel()
    
    @State var progress: Double = 0.37 //temp
    
    var body: some View {
        NavigationStack {
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
                            NavigationLink(destination: SectorView(sectorName: sector.name)) {
                                Text("Detail")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                            }
                        }
                        ProgressView(value: progress)
                    }
                }
            }
            .navigationTitle("Task Hub")
        }
    }
}

#Preview {
    TaskHubView()
}
