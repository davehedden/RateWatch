//
//  RaceDetailHeader.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/6/21.
//

import SwiftUI

struct RaceDetailHeader: View {
    let race: Race
    let titleDisplay: String
    
    var body: some View {
        let (fastestLap, fastestLapIndex, avgLap) = race.fastestAndAverageLap()
        let (fastestAltLap, fastestAltLapIndex, avgAltLap) = race.fastestAndAverageAltLap()
        
        VStack(alignment: .leading) {
            Text(race.title ?? race.defaultTitle)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 4)
                

            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    if let date = race.timestamp {
                        Text(date, formatter: dateFormatter)
                            .font(.headline)
                            .fontWeight(.bold)

                        Text(date, formatter: datetimeFormatter)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
                
                Text("Final Time: \(race.finalTime())")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 1)
            
            HStack(alignment: .top, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Fastest Lap: \(fastestLap) (\(fastestLapIndex))")
                        .font(.footnote)
                        .fontWeight(.light)
                    Text("Average Lap: \(avgLap)")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                
                VStack(alignment: .leading) {
                    Text("Fastest Alt Lap: \(fastestAltLap) (\(fastestAltLapIndex))")
                        .font(.footnote)
                        .fontWeight(.light)
                    Text("Average Alt Lap: \(avgAltLap)")
                        .font(.footnote)
                        .fontWeight(.light)
                }
            }
        }
        .padding(.leading, 20)
        .padding(.bottom, 20)
    }
}

//struct AdaptingStack<Content>: View where Content: View {
//  init(@ViewBuilder content: @escaping () -> Content) {
//    self.content = content
//  }
//
//  var content: () -> Content
//  @Environment(\.sizeCategory) var sizeCategory
//
//    var body: some View {
//      switch sizeCategory {
//      case .accessibilityLarge,
//           .accessibilityExtraLarge,
//           .accessibilityExtraExtraLarge,
//           .accessibilityExtraExtraExtraLarge:
//        return AnyView(VStack(content: self.content).padding(.top, 10))
//      default:
//        return AnyView(HStack(spacing: 30, content: self.content))
//      }
//    }
//}


//struct RaceDetailHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(alignment: .leading) {
//            RaceDetailHeader()
//                .preferredColorScheme(.dark)
//            Spacer()
//        }
//    }
//}
