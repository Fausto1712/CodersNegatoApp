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
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack(spacing:-15){
                    progressBar(isModalPresented: $isModalPresented)
                    AnimalFarmView()
                        .frame(height: 250)
                    ScrollView(.vertical){
                        VStack(spacing:15){
                            ForEach((0 ... taskViewModel.tasks.count-1), id: \.self) { i in
                                if taskViewModel.tasks[i].sector == sectorName {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(taskViewModel.tasks[i].name)
                                                .font(.title2)
                                                .bold()
                                            Text(taskViewModel.tasks[i].description)
                                        }
                                        .padding(10)
                                        Spacer()
                                        Toggle(isOn: $taskViewModel.tasks[i].done) {
                                            
                                        }
                                        //.toggleStyle(iOSCheckboxToggleStyle())

                                    }
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 6)
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
                    
                    PuzzleView(dismiss: {
                        isModalPresented = false
                    })
                }
            }
        }
    }
}

#Preview {
    SectorView(sectorName: "Sport")
}

struct progressBar: View {
    
    @State var progress: CGFloat = 1
    @State var taskDone: Int = 29
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
