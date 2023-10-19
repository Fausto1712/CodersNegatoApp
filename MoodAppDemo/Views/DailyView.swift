//
//  DailyView.swift
//  MoodAppDemo
//
//  Created by Danilo Luongo on 19/10/23.
//

import SwiftUI

struct DailyView: View {
    var sectorView = SectorViewModel()
    @State var progress: Double = 0
            
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 50)
                ZStack {
                    CircularProgressView(progress: 0.5, color: .orange)
                        .frame(width: 200, height: 200)
                    CircularProgressView(progress: 0.7, color: .green)
                        .frame(width: 130, height: 130)
                    CircularProgressView(progress: 0.3, color: .blue)
                        .frame(width: 60, height: 60)
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
                                NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                                    Text("Detail")
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
    DailyView()
}
