//
//  SizesSlideUpModal.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI

struct SizesSlideUpModal: View {
    
    var availablesSizes: [[ShoeInfo]]
    var selectedSize: Double?
    
    var body: some View {
        VStack(spacing: 20) {
            headerSection
            SizeView(shoeInfo: availablesSizes)
        }
        .background(Color.s800)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
    
    // MARK:- Auxialiary Views
    
    var headerSection: some View {
        HStack {
            Text("Available sizes")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Button("Size Chart", action: {
            })
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SizeView: View {
    
    var shoeInfo: [[ShoeInfo]]
    
    var body: some View {
        VStack {
            ForEach(shoeInfo, id: \.self) { array in
                HStack {
                    ForEach(array, id: \.self) { shoeInformation in
                        IndividualSize(shoeInformation: shoeInformation)
                    }
                }
            }
        }
    }
}

struct IndividualSize: View {
    
    var shoeInformation: ShoeInfo
    
    var body: some View {
        Text(String(shoeInformation.size))
            .frame(width: 60, height: 60, alignment: .center)
            .background(shoeInformation.isAvailable ? Color.s700 : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 25))
    }
}

struct SizesSlideUpModal_Previews: PreviewProvider {
    static var previews: some View {
        SizesSlideUpModal(availablesSizes: ShoeSizes.man.chunked(into: 5))
    }
}

struct ShoeSizes {
    static var man: [ShoeInfo] = [
        ShoeInfo(id: UUID(), isAvailable: true, size: "2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "2 1/2"),
        ShoeInfo(id: UUID(), isAvailable: false, size: "3"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "3 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "4"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "4 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "5"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "5 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "6"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "6 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "7"),
        ShoeInfo(id: UUID(), isAvailable: false, size: "7 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "8"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "8 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "9"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "9 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "10")
    ]
}

struct ShoeInfo: Identifiable, Hashable {
    var id: UUID
    var isAvailable: Bool
    var size: String
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
