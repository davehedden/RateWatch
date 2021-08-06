//
//  TagListView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 4/30/21.
//

import SwiftUI

struct TagListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Tag.title, ascending: true)],
        animation: .default)
    private var tags: FetchedResults<Tag>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tags, id: \.self) { tag in
                    Text(tag.title ?? "")
                }
            }
            .navigationBarTitle("Tags", displayMode: .inline)
            .navigationBarItems(leading: HStack {
                AddButton()
                EditButton()
            }, trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
            })
        }
        .preferredColorScheme(.dark)
    }
}

struct AddButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Add")
        }
        .padding(.trailing)
    }
}

struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView()
    }
}
