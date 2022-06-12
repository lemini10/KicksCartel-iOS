//
//  Wireframe.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import SwiftUI

class Wireframe {
    static func createBrowseView() -> some View {
        let viewModel: BrowseViewModelProtocol = BrowseViewModel()
        let view: BrowseView = BrowseView(browseViewModel: viewModel)
        return view
    }
}
