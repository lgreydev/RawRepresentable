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
    
    init() {}
    
    enum CodingKeys: CodingKey {
        case name
        case allowNotifications
        case skillLavel
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.allowNotifications = try container.decode(Bool.self, forKey: .allowNotifications)
        self.skillLavel = try container.decode(SkillLevel.self, forKey: .skillLavel)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.allowNotifications, forKey: .allowNotifications)
        try container.encode(self.skillLavel, forKey: .skillLavel)
    }
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
