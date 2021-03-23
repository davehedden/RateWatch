//
//  MenuBar.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct MenuBar: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    @State var showSettings = false
    @State var showSaves = false
    
    var body: some View {
        HStack {
            Button(action: {
                showSaves.toggle()
            }) {
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray))
            }
            .sheet(isPresented: $showSaves, content: {
                RaceListView()
            })
            
            Spacer()
            
            if stopwatch.timerStatus != .running {
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.systemGray))
                }
                .sheet(isPresented: $showSettings, content: {
                    SettingsView(settings: settings, stopwatch: stopwatch)
                })
            }
        }
        .padding(.horizontal, 8)
        .padding(.bottom, 4)
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar(settings: testSettings, stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
