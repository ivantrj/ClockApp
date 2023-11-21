//
//  MainView.swift
//  ClockApp
//
//  Created by ivan ruwido  on 21.11.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            StopwatchView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Stopwatch")
                }
        }
    }
}

#Preview {
    MainView()
}
