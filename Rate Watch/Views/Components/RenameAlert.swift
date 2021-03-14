//
//  RenameAlert.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/23/21.
//

import SwiftUI

struct RenameAlert: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isPresented: Bool
    @Binding var titleDisplay: String
    
    var race: Race
    @State var text: String
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Text("Enter New Title")
                .font(.headline)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
                .background(Color(.darkGray))
            
            HStack {
                Button(action: {
                    isPresented = false
                }) {
                    Text("CANCEL")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(.flatRedCAN)
                }
                .frame(width: (screenSize.width * 0.7 / 2.5))
                
                Divider()
                    .background(Color(.lightGray))
                
                Button(action: {
                    isPresented = false
                    race.title = text
                    titleDisplay = text
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }) {
                    Text("SAVE")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.flatGreenCAN)
                }
                .frame(width: (screenSize.width * 0.7 / 2.5))
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.2)
        .background(Color(.darkGray))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .offset(y: isPresented ? 0 : screenSize.height)
        .animation(.default)
    }
}

//struct RenameAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        RenameAlert(isPresented: .constant(true), race: <#Race#>, text: .constant("New title"))
//            .preferredColorScheme(.dark)
//    }
//}
