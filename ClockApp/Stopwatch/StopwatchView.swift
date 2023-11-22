//
//  ContentView.swift
//  ClockApp
//
//  Created by ivan on 21.11.23.
//

import SwiftUI

struct StopwatchView: View {
    @State private var time = 0.0
    @State private var isRunning = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(time, specifier: "%.1f")")
                .foregroundStyle(.white)
                .font(.system(size: 50))
                .padding()
            
            HStack {
                Button {
                    time = 0.0
                    isRunning = false
                } label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.gray)
                        .overlay(
                            Text("Reset")
                                .foregroundStyle(.white)
                                .bold()
                        )
                }
                .padding()
                
                Spacer()
                
                Button {
                    isRunning.toggle()
                } label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(isRunning ? .red : .green)
                        .overlay(
                            Text(isRunning ? "Stop" : "Start")
                                .foregroundStyle(.white)
                                .bold()
                        )
                }
                .padding()
            }
        }
        .preferredColorScheme(.dark)
        .onReceive(timer) { _ in
            if isRunning == true {
                time += 0.1
            }
        }
    }
}

#Preview {
    StopwatchView()
}
