//
//  LapDisplayList.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct LapDisplayList: View {
    @ObservedObject var stopwatch: Stopwatch
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                
                ForEach(stopwatch.tempLapArray, id: \.id) { lap in
                    TempLapDisplayRow(lap: lap)
                        .listRowInsets(.init())
                        .padding(.vertical, 2)
                }
                .onChange(of: stopwatch.tempLapArray.count) { _ in
                    value.scrollTo(stopwatch.tempLapArray.count, anchor: .bottom)
                }
            }
        }
    }
}

struct LapDisplayList_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayList(stopwatch: testStopwatch)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
