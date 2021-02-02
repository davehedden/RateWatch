//
//  LapDisplayRow.swift
//  Rate Watch
//
//  Created by Dave Hedden on 2/1/21.
//

import SwiftUI

struct LapDisplayRow: View {
    var lap: Lap
    @State var isExpanded: Bool = false
    
    var body: some View {
        Button(action: {
            isExpanded.toggle()
        }) {
            VStack {
                HStack {
                    LapDisplayCount(num: lap.lapNum)
                        .foregroundColor(.white)
                    
                    LapDisplayTime(time: lap.cumTime, type: .cumulative)
                        .foregroundColor(.white)
                    
                    LapDisplayTime(time: lap.lapTime, type: .lap)
                        .foregroundColor(.flatYellowCAN)
                    
                    LapDisplayTime(time: lap.lapTimeAlternate, type: .lap)
                        .foregroundColor(.flatYellowUSHL)
                    
                    Spacer()
                    
                    LapDisplayCount(num: lap.strokeCount)
                        .foregroundColor(.flatBlueUSHL)
                    
                    if lap.rateUnits == K.RateUnits.cyclesPerMinute {
                        LapDisplayTime(time: lap.medianStrokeRate(), type: .rateCyclesPerMinute)
                            .foregroundColor(.flatBlueUSHL)
                    } else {
                        LapDisplayTime(time: lap.medianStrokeRate(), type: .rateSecondsPerCycle)
                            .foregroundColor(.flatBlueUSHL)
                    }
                    
                }
                .padding(.vertical, 0)
                
                if isExpanded {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if let rates = lap.strokeRates {
                                ForEach(rates, id: \.self) { rate in
                                    Text(String(rate))
                                        .font(.system(size: 13))
                                        .foregroundColor(.flatBlueUSHL)
                                        .frame(width: 36)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}

//struct LapDisplayRow_Previews: PreviewProvider {
//    static var previews: some View {
//        LapDisplayRow(lap: sampleLapArray1[3])
//            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
//    }
//}
