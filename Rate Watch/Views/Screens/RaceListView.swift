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
                
                RaceFilteredList(filter: searchText)
            }
            .navigationBarTitle("Saved Data")
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
}

struct RaceListView_Previews: PreviewProvider {
    static var previews: some View {
        RaceListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
