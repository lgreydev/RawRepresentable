//
//  ContentView.swift
//  RawRepresentable
//
//  Created by Serhii Lukashchuk on 2025-01-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @AppStorage("skillLevel") var skillLevel: SkillLevel = .beginner
        
        NavigationStack {
            Form {
                Picker("Skill Level", selection: $skillLevel) {
                    ForEach(SkillLevel.allCases) { skillLevel in
                        Text(skillLevel.rawValue.capitalized)
                    }
                }
            }
            .navigationTitle("Setting")
        }
        .onAppear() {
            print(URL.libraryDirectory.appending(path:"Preferences").path())
        }
    }
}

#Preview {
    ContentView()
}
