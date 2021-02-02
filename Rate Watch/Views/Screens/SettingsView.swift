//
//  SettingsView.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: Settings
    @ObservedObject var stopwatch: Stopwatch
    @Environment(\.presentationMode) var presentationMode
    @State var ratePopoverIsPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: HStack {
                    Text("Rate Options")
                    Button(action: {
                        ratePopoverIsPresented.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                    }
                }) {
                    HStack {
                        Text("Rate Units")
                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                        Picker(selection: $settings.rateUnits, label: Text("")) {
                            Text("Secs/Cycle").tag(K.RateUnits.secondsPerCycle)
                            Text("Cycles/Min").tag(K.RateUnits.cyclesPerMinute)
                        }
                        .frame(width: 180.0)
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: settings.rateUnits, perform: { value in
                            stopwatch.rateUnits = value
                        })
                    }
                    
                    HStack {
                        Text("Cycles to Count")
                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                        Picker(selection: $settings.rateBase, label: Text("")) {
                            Text("1").tag(1.0)
                            Text("2").tag(2.0)
                            Text("3").tag(3.0)
                        }
                        .frame(width: 120.0)
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: settings.rateBase, perform: { value in
                            stopwatch.rateBase = value
                        })
                    }
                }
                
                Section(header: Text("Button Haptics")) {
                    Toggle(isOn: $settings.startButtonHaptics) {
                        Text("Start/Stop Button")
                    }
                    Toggle(isOn: $settings.startButtonHaptics) {
                        Text("Lap Button")
                    }
                    Toggle(isOn: $settings.startButtonHaptics) {
                        Text("Count & Rate Buttons")
                    }
                    Toggle(isOn: $settings.add5ButtonHaptics) {
                        Text("Add :05 Button")
                    }
                    Toggle(isOn: $settings.resetButtonHaptics) {
                        Text("Reset Button")
                    }
                    Toggle(isOn: $settings.saveButtonHaptics) {
                        Text("Save Button")
                    }
                }
                
                Section(header: Text("Support"),
                        footer: HStack {
                            Spacer()
                            Text("Support is available in English only.")
                            Spacer()
                        }) {
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack {
                            Image(systemName: "star.circle")
                                .font(.system(size: 28))
                            Text("Rate in the App Store")
                        }
                    }
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .font(.system(size: 28))
                            Text("Make a Donation")
                        }
                    }
                    Link(destination: URL(string: "mailto:wavmaker11@gmail.com")!) {
                        HStack {
                            Image(systemName: "envelope.circle")
                                .font(.system(size: 28))
                            Text("Contact the Developer")
                        }
                    }
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                              Text("\(version)")
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
            .toolbar {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                }
            }
        } // End of NavigationView
        .preferredColorScheme(.dark)
    } // End of body
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: testSettings, stopwatch: testStopwatch)
    }
}
