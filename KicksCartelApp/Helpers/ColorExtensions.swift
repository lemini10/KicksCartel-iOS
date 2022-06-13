//
//  ColorExtensions.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 12/06/22.
//

import Foundation
import SwiftUI

extension Color {
    public static var purpleGradient: Color {
        return Color(UIColor(red: 54/255, green: 0/255, blue: 51/255, alpha: 1.0))
    }
    
    public static var blueGradient: Color {
        return Color(UIColor(red: 11/255, green: 135/255, blue: 147/255, alpha: 1.0))
    }

    public static var s700: Color {
        return Color(UIColor(red: 0.325, green: 0.502, blue: 0.718, alpha: 1))
    }
    
    public static var s800: Color {
        return Color(UIColor(red: 0.204, green: 0.353, blue: 0.576, alpha: 1))
    }

    public static var grayBackgrounds: Color {
        return Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,opacity: 0.3)
    }
}
