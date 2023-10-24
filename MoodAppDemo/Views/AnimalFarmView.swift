//
//  ContentView.swift
//  AnimalsTest
//
//  Created by Fausto Pinto Cabrera on 19/10/23.
//

import SwiftUI

struct AnimalFarmView: View {
    var body: some View {
        VStack {
            Spacer()
            MovingSquareView()
            Spacer()
        }
    }
}

#Preview {
    AnimalFarmView()
}

struct MovingSquareView: View {
    @State private var squares: [Square] = []
    @State private var showOverlay = false
    
    @State private var isModalPresented: Bool = false
    @State private var selectedSquare: Square?
    
    var body: some View {
        ZStack {
            Image("Back1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .padding(20)
            ForEach($squares) { squareBinding in
                Rectangle()
                    .overlay(
                        Image(showOverlay ? squareBinding.wrappedValue.imageName : squareBinding.wrappedValue.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 20)
                            .clipped()
                    )
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black.opacity(0))
                    .position(squareBinding.wrappedValue.position)
                    .onTapGesture {
                        self.selectedSquare = squareBinding.wrappedValue
                        self.isModalPresented = true
                    }
                    .onAppear {
                        self.moveRandomly(for: squareBinding)
                    }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.addSquare()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                    .padding(20)
                }
            }
        }
        .sheet(isPresented: $isModalPresented) {
            if let selectedSquare = self.selectedSquare {
                SquareDetailModal(square: selectedSquare, isModalPresented: $isModalPresented)
            }
        }
    }
    
    func addSquare() {
        var newSquare = Square()
        newSquare.animalName = "Jacinto"
        squares.append(newSquare)
    }
    
    func moveRandomly(for square: Binding<Square>) {
        
        var randomX = square.wrappedValue.position.x
        var randomY = square.wrappedValue.position.y
        
        if (Bool.random()){
            randomX = CGFloat.random(in: 30...(340))
        } else {
            randomY = CGFloat.random(in: 34...(195))
        }
        
        if(randomX != square.wrappedValue.position.x){
            if(randomX > square.wrappedValue.position.x){
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[2]
            } else {
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[1]
            }
        } else {
            if(randomY > square.wrappedValue.position.y){
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[0]
            } else {
                square.wrappedValue.imageName = square.wrappedValue.spriteNames[3]
            }
        }
        self.showOverlay.toggle()
        
        withAnimation(.linear(duration: 3.0)) {
            square.wrappedValue.position = CGPoint(x: randomX, y: randomY)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.moveRandomly(for: square)
        }
    }
}

struct SquareDetailModal: View {
    @State private var newName: String = ""
    var square: Square
    @Binding var isModalPresented: Bool
    
    var body: some View {
        VStack {
            Text("Animal Details")
                .font(.title)
                .padding()
            
            Text(square.animalName)
                .padding()
                .font(.title2)
                .background(Color.white)
                .cornerRadius(8)
            
            Text("Date Obtained: \(square.dateObtained)")
                .padding()
                .font(.title2)
            
            Spacer()
            
            Image(square.spriteNames[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .clipped()
            
            Spacer()
            
            Button(action: {
                self.isModalPresented = false
            }) {
                Text("Close")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct Square: Identifiable {
    let id = UUID()
    var position: CGPoint = CGPoint(x: 200, y: 120)
    var imageName: String = "AAD"
    var animalName: String = "Paco"
    var dateObtained: String = Date().formatted(date: .long, time: .shortened)
    @Binding var spriteNames: [String]
    
    init() {
        self._spriteNames = Binding.constant([
            ["AAD","AAH","AAR","AAU"],
            ["ABD","ABH","ABR" ,"ABU"],
            ["AMD","AMH","AMR","AMU"],
            ["ASD","ASH","ASR","ASU"],
            ["AVD","AVH","AVR","AVU"],
            ["AWD","AWH","AWR","AWU"],
            ["BAD","BAH","BAR","BAU"],
            ["BBD","BBH","BBR","BBU"],
            ["BMD","BMH","BMR","BMU"],
            ["BSD","BSH","BSR","BSU"],
            ["BVD","BVH","BVR","BVU"],
            ["BWD","BWH","BWR","BWU"],
            ["CAD","CAH","CAR","CAU"],
            ["CBD","CBH","CBR","CBU"],
            ["CMD","CMH","CMR","CMU"],
            ["CWD","CWH","CWR","CWU"],
            ["DAD","DAH","DAR","DAU"],
            ["DMD","DMH","DMR","DMU"],
            ["DWD","DWH","DWR","DWU"],
            ["FMD","FMH","FMR","FMU"],
            ["FWD","FWH","FWR","FWU"],
            ["GMD","GMH","GMR","GMU"],
            ["GWD","GWH","GWR","GWU"]
        ].randomElement() ?? ["ABD","ABH","ABR","ABU"])
    }
}
