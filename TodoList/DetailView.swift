//
//  DetailView.swift
//  TodoList
//
//  Created by Parimal Devi on 30/06/25.
//

import SwiftUI

struct DetailView: View {
    var passedvalue: String
    @Environment(\.dismiss ) private var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.mint)
            Text("I am a swifty legend and I passed in the value - \(passedvalue) ")
                .font(.largeTitle)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            Spacer()
            Button("get back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    DetailView(passedvalue: "Item 7")
}
