//
//  RaceListView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct RaceListView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Race.id, ascending: true)],
        animation: .default)
    
    private var races: FetchedResults<Race>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(races) { race in
                    let predicate = NSPredicate(format: "raceID == \(race.id)")
                    
                    let lastLap = race.laps?.lastObject as? Lap
                    let cumTime = lastLap?.cumTime
                    
                    NavigationLink(destination: RaceDetailView(predicate: predicate)) {
                        HStack {
                            if let date = race.timestamp {
                                Text(date, formatter: dateFormatter)
                            }
                            
                            if let time = cumTime {
                                Text(String(time.formattedLapDisplay()))
                            }
                        }
                    }
                }
                .onDelete(perform: deleteRaces)
            }
            .navigationBarTitle("Saved Data")
//            .navigationBarItems(trailing: EditButton())
//                .foregroundColor(.blue)
            .toolbar {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    

    private func deleteRaces(offsets: IndexSet) {
        withAnimation {
            offsets.map { races[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView()
            .preferredColorScheme(.dark)
    }
}
