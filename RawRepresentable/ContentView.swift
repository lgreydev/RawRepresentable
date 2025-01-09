//
//  ContentView.swift
//  RawRepresentable
//
//  Created by Serhii Lukashchuk on 2025-01-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @AppStorage("skillLevel") var SkillLevel: SkillLevel = .beginner
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
