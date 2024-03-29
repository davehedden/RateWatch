//
//  LapDisplayCount.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct LapDisplayCount: View {
    var num: Double
    
    var body: some View {
        Text(num.clean)
            .font(.system(size: 14))
            .fontWeight(.medium)
            .frame(width: 32, alignment: .trailing)
    }
}

struct LapDisplayCount_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayCount(num: 22.5)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
