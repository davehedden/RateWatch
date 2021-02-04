//
//  RaceDetailView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct RaceDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Lap.id, ascending: true)], predicate: predicate,
//        animation: .default)
    
    var lapsRequest: FetchRequest<Lap>
    var laps: FetchedResults<Lap> { lapsRequest.wrappedValue }
    var predicate: NSPredicate
    
    init(predicate: NSPredicate) {
        self.predicate = predicate
        self.lapsRequest = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Lap.id, ascending: true)], predicate: predicate, animation: .default)
    }
    
    var body: some View {
        
        VStack {
            LapDisplayRowHeader()
            
            List {
                ForEach(laps) { lap in
                    LapDisplayRow(lap: lap)
                        .listRowInsets(.init())
                        .padding(.vertical, 2)
                }
            }
            .padding(.horizontal, 5)
        }
    }
}

struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetailView(predicate: samplePredicate)
            .preferredColorScheme(.dark)
    }
}
