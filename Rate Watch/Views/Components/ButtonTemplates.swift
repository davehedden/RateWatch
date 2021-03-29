//
//  ButtonTemplates.swift
//  Rate Watch
//
//  Created by Dave Hedden on 1/21/21.
//

import SwiftUI

struct BigButton: View {
    let buttonIconName: String
    let label: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Image(systemName: buttonIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(height: 130)
    }
}

struct SmallButton: View {
    let buttonIconName: String
    let label: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Image(systemName: buttonIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct SmallRateButton: View {
    let buttonIconName: String
    let label: String
    let rateIconName: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Image(systemName: buttonIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Image(systemName: rateIconName)
                        .font(Font.system(size: 20).bold())
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct SmallButtonInactive: View {
    let buttonIconName: String
    let label: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Image(systemName: buttonIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)

                    Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)

                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct LongRateButton: View {
    let buttonIconName: String
    let label: String
    let rateIconName: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Image(systemName: buttonIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Text(label)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                    Image(systemName: rateIconName)
                        .font(Font.system(.headline).bold())
                        .shadow(color: .black, radius: 1, x: 1, y: 1.25)
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct SolidButtonStyle: ButtonStyle {
    let buttonColor: Color
    let buttonColorPressed: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? buttonColorPressed : buttonColor)
            .cornerRadius(14)
    }
}

struct ButtonTemplates_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(buttonIconName: "play.fill", label: "START")
            .previewLayout(.sizeThatFits)

    }
}
