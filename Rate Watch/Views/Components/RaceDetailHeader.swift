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
            if let title = race.title {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            HStack {
                if let date = race.timestamp {
                    Text(date, formatter: dateFormatter)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(date, formatter: datetimeFormatter)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom, 10)
    
            Text("Final Time: \(race.finalTime())")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            
            HStack(spacing: 30) {
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

//struct RaceDetailHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack(alignment: .leading) {
//            RaceDetailHeader()
//                .preferredColorScheme(.dark)
//            Spacer()
//        }
//    }
//}
