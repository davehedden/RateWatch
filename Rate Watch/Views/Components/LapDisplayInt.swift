//
//  LapDisplayInt.swift
//  Rate Watch
//
//  Created by Dave Hedden on 4/24/21.
//

import SwiftUI

struct LapDisplayInt: View {
    var num: Int
    
    var body: some View {
        Text(String(num))
            .font(.system(size: 14))
            .fontWeight(.medium)
            .frame(width: 28, alignment: .trailing)
    }
}

struct LapDisplayInt_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayInt(num: 22)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
