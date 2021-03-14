//
//  RaceDetailView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct RaceDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var renameAlertPresented = false
    @State var titleDisplay: String = ""
    
    var race: Race
    var lapsRequest: FetchRequest<Lap>
    var laps: FetchedResults<Lap> { lapsRequest.wrappedValue }
    
    init(race: Race) {
        self.race = race
        self.lapsRequest = FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Lap.id, ascending: true)], predicate: NSPredicate(format: "raceID == \(race.id)"), animation: .default)
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                RaceDetailHeader(race: race, titleDisplay: titleDisplay)
                    .padding(.top, 8)
                
                LapDisplayRowHeader()
                    .padding(.trailing, 8)
                
                List {
                    ForEach(laps) { lap in
                        LapDisplayRow(lap: lap)
                            .listRowInsets(.init())
                            .padding(.vertical, 2)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.trailing, 10)
            }
            
            RenameAlert(isPresented: $renameAlertPresented, titleDisplay: $titleDisplay, race: race, text: race.title ?? "")
        }
        .preferredColorScheme(.dark)
        .navigationBarTitle("", displayMode: .inline)
        .toolbar(content: {
            Button(action: {
                renameAlertPresented = true
            }) {
                Text("Rename")
            }
        })
    }
}

struct RaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        
        let newRace = Race.init(context: viewContext)
        newRace.id = 1.0
        newRace.timestamp = Date()
        
        let newLap1 = Lap.init(context: viewContext)
        newLap1.id = 1.1
        newLap1.raceID = 1.0
        newLap1.lapNum = 1
        newLap1.cumTime = 31.48
        newLap1.lapTime = 31.48
        newLap1.lapTimeAlternate = 0
        newLap1.strokeCount = 14
        newLap1.strokeRates = [1.13, 1.18, 1.19]
        newLap1.rateUnits = K.RateUnits.secondsPerCycle
        newLap1.race = newRace
        
        let newLap2 = Lap.init(context: viewContext)
        newLap2.id = 1.2
        newLap2.raceID = 1.0
        newLap2.lapNum = 2
        newLap2.cumTime = 65.74
        newLap2.lapTime = 34.26
        newLap2.lapTimeAlternate = 65.74
        newLap2.strokeCount = 16
        newLap2.strokeRates = [1.19, 1.22, 1.22]
        newLap2.rateUnits = K.RateUnits.secondsPerCycle
        newLap2.race = newRace
        
        let newLap3 = Lap.init(context: viewContext)
        newLap3.id = 1.3
        newLap3.raceID = 1.0
        newLap3.lapNum = 3
        newLap3.cumTime = 100.71
        newLap3.lapTime = 34.97
        newLap3.lapTimeAlternate = 0
        newLap3.strokeCount = 17
        newLap3.strokeRates = [1.24, 1.24, 1.25]
        newLap3.rateUnits = K.RateUnits.secondsPerCycle
        newLap3.race = newRace
        
        let newLap4 = Lap.init(context: viewContext)
        newLap4.id = 1.4
        newLap4.raceID = 1.0
        newLap4.lapNum = 4
        newLap4.cumTime = 133.79
        newLap4.lapTime = 33.08
        newLap4.lapTimeAlternate = 68.05
        newLap4.strokeCount = 18
        newLap4.strokeRates = [1.21, 1.21, 1.17]
        newLap4.rateUnits = K.RateUnits.secondsPerCycle
        newLap4.race = newRace
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return RaceDetailView(race: newRace)
            .environment(\.managedObjectContext, viewContext)
            .preferredColorScheme(.dark)
    }
}
