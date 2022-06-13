//
//  SizeCell.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 11/03/22.
//

import SwiftUI

struct SizeCell: View {
    var body: some View {
        ZStack {
            Color.blue
                .cornerRadius(10)
            Text("10.5")
                .foregroundColor(.white)
        }
    }
}

struct SizeCell_Previews: PreviewProvider {
    static var previews: some View {
        SizeCell()
            .frame(width: 50, height: 50, alignment: .center)
    }
}
