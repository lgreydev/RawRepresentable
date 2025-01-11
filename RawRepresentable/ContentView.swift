//
//  ContentView.swift
//  RawRepresentable
//
//  Created by Serhii Lukashchuk on 2025-01-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        @AppStorage("name") var name: String = ""
//        @AppStorage("allowNotification") var allowNotification: Bool = false
//        @AppStorage("skillLevel") var skillLevel: SkillLevel = .beginner
        
        @AppStorage("appSetting") var appSetting = AppSettings()
        
        NavigationStack {
            Form {
                
                TextField("Name", text: $appSetting.name)
                    .textFieldStyle(.roundedBorder)
                
                Toggle("Allow Notification", isOn: $appSetting.allowNotifications)
                
                Picker("Skill Level", selection: $appSetting.skillLevel) {
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
