//
//  LapDisplayRowHeader.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct LapDisplayRowHeader: View {
    var body: some View {
        HStack {
            Text("#")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 28, alignment: .trailing)
            
            Text("Total")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 68, alignment: .trailing)
            
            Text("Lap")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 68, alignment: .trailing)
            
            Text("Alt Lap")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 68, alignment: .trailing)
            
            Spacer()
            
            Text("Ct")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 32, alignment: .trailing)
            
            Text("Rt")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .frame(width: 36, alignment: .trailing)
        }
        .padding(.horizontal, 5)
    }
}

struct LapDisplayRowHeader_Previews: PreviewProvider {
    static var previews: some View {
        LapDisplayRowHeader()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
