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
        sortDescriptors: [NSSortDescriptor(keyPath: \Race.id, ascending: false)],
        animation: .default)
    private var races: FetchedResults<Race>
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List {
                    ForEach(races) { race in
                        NavigationLink(destination: RaceDetailView(race: race)) {
                            if let title = race.title {
                                if title == "" {
                                    HStack {
                                        Text(race.timestamp!, formatter: dateFormatter)
                                        
                                        Text(race.timestamp!, formatter: datetimeFormatter)
                                        
                                        Text(race.finalTime())
                                    }
                                } else {
                                    Text(title)
                                }
                                
                            } else {
                                HStack {
                                    Text(race.timestamp!, formatter: dateFormatter)
                                    
                                    Text(race.timestamp!, formatter: datetimeFormatter)
                                    
                                    Text(race.finalTime())
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteRaces)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Saved Data")
//            .navigationBarItems(trailing: EditButton())
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

struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .preferredColorScheme(.dark)
    }
}
