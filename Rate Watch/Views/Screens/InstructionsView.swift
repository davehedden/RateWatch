//
//  InstructionsView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/17/21.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack(alignment: .leading) {
                        TextGroup(heading: K.Instructions.add5ButtonHeading, text: K.Instructions.add5ButtonInstructions)
                            .padding(.bottom, 20)
                        
                        TextGroup(heading: K.Instructions.countButtonHeading, text: K.Instructions.countButtonInstructions)
                            .padding(.bottom, 20)
                        
                        TextGroup(heading: K.Instructions.rateButtonHeading, text: K.Instructions.rateButtonInstructions)
                            .padding(.bottom, 5)
                        
                        TextGroupIndented(heading: K.Instructions.rateHowToHeading, text: K.Instructions.rateHowToInstructions)
                            .padding(.bottom, 5)
                        
                        TextGroupIndented(heading: K.Instructions.rateSettingsHeading, text: K.Instructions.rateSettingsInstructions)
                            .padding(.bottom, 20)
                        
                        TextGroup(heading: K.Instructions.lapDisplayHeading, text: K.Instructions.lapDisplayInstructions)
                            .padding(.bottom, 5)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("#:")
                                    .fontWeight(.bold)
                                Text("Displays the lap number.")
                            }

                            HStack {
                                Text("Total:")
                                    .fontWeight(.bold)
                                Text("Displays the cumulative split.")
                            }
                            
                            HStack {
                                Text("Lap:")
                                    .fontWeight(.bold)
                                Text("Displays the lap split.")
                            }
                            
                            HStack {
                                Text("Alt Lap:")
                                    .fontWeight(.bold)
                                Text("Displays the sum of the last 2 lap splits.")
                            }
                            
                            HStack {
                                Text("Ct:")
                                    .fontWeight(.bold)
                                Text("Displays the stroke count for that lap.")
                            }
                            
                            HStack {
                                Text("Rt:")
                                    .fontWeight(.bold)
                                Text("Displays the median stroke rate for that lap.")
                            }
                        }
                        .font(.system(size: 14))
                        .padding(.leading, 16)
                        .padding(.bottom, 5)
                        
                        Text("Tapping on the lap row will expand the view to show all the stroke rates for that lap. Tap on the row again to collapse.")
                            .font(.system(size: 14))
                            .padding(.bottom, 20)
                        
                        TextGroup(heading: K.Instructions.saveButtonHeading, text: K.Instructions.saveButtonInstructions)
                            .padding(.bottom, 20)
                            
                    }
                    .navigationBarTitle("Instructions")
                    .toolbar {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark.circle")
                        }
                    }
                    .padding(.horizontal, 16)
                    
                }
                .frame(width: geo.size.width)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
            .preferredColorScheme(.dark)
    }
}

struct TextGroup: View {
    let heading: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.headline)
            Text(text)
                .font(.system(size: 14))
        }
    }
}

struct TextGroupIndented: View {
    let heading: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.system(size: 14))
                .fontWeight(.bold)
            Text(text)
                .font(.system(size: 14))
        }
        .padding(.leading, 16)
    }
}
