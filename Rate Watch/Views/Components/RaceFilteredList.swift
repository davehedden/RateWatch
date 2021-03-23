//
//  RaceList.swift
//  Rate Watch
//
//  Created by Dave Hedden on 3/22/21.
//

import CoreData
import SwiftUI

struct RaceFilteredList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var fetchRequest: FetchRequest<Race>
    var races: FetchedResults<Race> {
        fetchRequest.wrappedValue
    }
    
    init(filter: String) {
        if filter.isEmpty {
            fetchRequest = FetchRequest<Race>(entity: Race.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Race.timestamp, ascending: false)])
        } else {
            fetchRequest = FetchRequest<Race>(entity: Race.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Race.timestamp, ascending: false)], predicate: NSPredicate(format: "title CONTAINS[c] %@", filter))
        }
    }
    
    var body: some View {
        List {
            ForEach(races, id: \.self) { race in
                NavigationLink(destination: RaceDetailView(race: race)) {
                    Text(race.title!)
                }
            }
            .onDelete(perform: deleteRaces)
        }
        .listStyle(PlainListStyle())
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

//struct RaceList_Previews: PreviewProvider {
//    static var previews: some View {
//        RaceList()
//    }
//}
