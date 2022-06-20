//
//  ProfileRow.swift
//  KicksCartelApp
//
//  Created by Luis Roberto Blancas Lemini on 19/06/22.
//

import SwiftUI

struct ProfileRow: View {
    var desiredRow: ProfileRows

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: desiredRow.image)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.leading)
                .foregroundColor(.s800)
            VStack(alignment: .leading,spacing: 5) {
                Text(desiredRow.title)
                    .fontWeight(.bold)
                    .padding(.top, 5)
                Text(desiredRow.details)
                    .fontWeight(.light)
                    .padding(.bottom, 5)
            }
            Spacer()
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(desiredRow: .Answers)
    }
}

enum ProfileRows {
    case Profile
    case Buying
    case Shipping
    case Payments
    case Answers
    
    var image: String {
        switch self {
        case .Profile:
            return "person"
        case .Buying:
            return "cart"
        case .Shipping:
            return "house"
        case .Payments:
            return "creditcard"
        case .Answers:
            return "questionmark"
        }
    }
    
    var title:String {
        switch self {
        case .Profile:
            return "Profile Information"
        case .Buying:
            return "Buying"
        case .Shipping:
            return "Shipping Information"
        case .Payments:
            return "Payment Information"
        case .Answers:
            return "How it works?"
        }
    }
    
    var details: String {
        switch self {
        case .Profile:
            return "Modify password,name,size,email"
        case .Buying:
            return "Track,modify or view orders"
        case .Shipping:
            return "Save,edit or remove address"
        case .Payments:
            return "Add or remove payment methods"
        case .Answers:
            return "See apps tutorial"
        }
    }
}

