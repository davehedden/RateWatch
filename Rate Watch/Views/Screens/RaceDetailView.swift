//
//  RaceDetailView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct RaceDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var lapsRequest: FetchRequest<Lap>
    var laps: FetchedResults<Lap> { lapsRequest.wrappedValue }
    var race: Race
    
    init(race: Race) {
        self.race = race
        self.lapsRequest = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Lap.id, ascending: true)], predicate: NSPredicate(format: "raceID == \(race.id)"), animation: .default)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            RaceDetailHeader(race: race)
            
            LapDisplayRowHeader()
                .padding(.trailing, 8)
            
            List {
                ForEach(laps) { lap in
                    LapDisplayRow(lap: lap)
                        .listRowInsets(.init())
                        .padding(.vertical, 2)
                }
            }
            .padding(.trailing, 10)
            
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

//struct RaceDetailView_Previews: PreviewProvider {
//    
//    
//    static var previews: some View {
//        RaceDetailView(race: races.first)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .preferredColorScheme(.dark)
//    }
//}
