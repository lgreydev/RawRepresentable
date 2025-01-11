//
//  AppSettings.swift
//  RawRepresentable
//
//  Created by Serhii Lukashchuk on 2025-01-10.
//

import Foundation

struct AppSettings: Codable {
    var name = ""
    var allowNotifications = false
    var skillLavel: SkillLevel = .beginner
}

extension AppSettings: RawRepresentable {
    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let appSettingsString = String(data: data, encoding: .utf8)
        else { return "" }
        return appSettingsString
    }
    
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let appSettings = try? JSONDecoder().decode(AppSettings.self, from: data)
        else { return nil }
        self = appSettings
    }
}
