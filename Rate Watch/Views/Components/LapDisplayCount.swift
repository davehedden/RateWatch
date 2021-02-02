//
//  LapDisplayCount.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct LapDisplayCount: View {
    var num: Int
    
    var body: some View {
        Text(String(num))
            .font(.system(size: 14))
            .fontWeight(.medium)
            .frame(width: 28, alignment: .trailing)
    }
}

struct LapDisplayCount_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayCount(num: sampleLapArray1[4].strokeCount)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
