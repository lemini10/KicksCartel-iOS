//
//  SizesSlideUpModal.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI
import Combine

struct SizesSlideUpModal: View {
    
    @Binding var isOpen: Bool
    
    let data: [ShoeInfo]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var selectedSizeAction: ((String) -> Void)
    
    var body: some View {
        GeometryReader { screen in
            ZStack(alignment: .bottom) {
                if isOpen {
                    backgroundDismissable
                    VStack {
                        headerSection
                        sizesGridView
                    }
                    .background(Color.white)
                    .animation(.interpolatingSpring(stiffness: 200.00, damping: 25.0, initialVelocity: 0.2))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    // MARK:- Auxialiary Views
    
    var backgroundDismissable: some View {
        Color.gray
            .opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture {
                isOpen = false
            }
    }
    var headerSection: some View {
        HStack {
            Text("Available sizes")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Button("Size Chart", action: {
            })
        }
        .foregroundColor(.black)
        .padding()
    }
    
    var sizesGridView: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(data, id: \.self) { shoe in
                IndividualSize(size: shoe.size , isAvailable: shoe.isAvailable)
                    .onTapGesture {
                        selectedSizeAction(shoe.size)
                    }
                    .disabled(!shoe.isAvailable)
            }
        }
        .padding(.horizontal)
    }
}

struct SlideUp_Preview: PreviewProvider {
    static var previews: some View {
        SizesSlideUpModal(isOpen: .constant(true), data: ShoeSizes.man, selectedSizeAction: { selectedSize in
            print(selectedSize)
            
        })
    }
}

struct IndividualSize: View {
    
    var size: String
    var isAvailable: Bool
    
    var body: some View {
        Text(size)
            .frame(width: 60, height: 60, alignment: .center)
            .background(isAvailable ? Color.s700 : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 25))
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
        ShoeInfo(id: UUID(), isAvailable: true, size: "10"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "10 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "11 1/2"),
        ShoeInfo(id: UUID(), isAvailable: true, size: "12")
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
