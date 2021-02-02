//
//  TempLapDisplayRow.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct TempLapDisplayRow: View {
    var lap: TempLap
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
                            ForEach(lap.strokeRates, id: \.self) { rate in
                                Text(String(rate))
                                    .font(.system(size: 13))
                                    .foregroundColor(.flatBlueUSHL)
                                    .frame(width: 36)
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

struct TempLapDisplayRow_Previews: PreviewProvider {
    static var previews: some View {
        TempLapDisplayRow(lap: sampleLapArray1[3])
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
