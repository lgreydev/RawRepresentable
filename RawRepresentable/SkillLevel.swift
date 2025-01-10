//
//  SkillLevel.swift
//  RawRepresentable
//
//  Created by Serhii Lukashchuk on 2025-01-09.
//

import Foundation

enum SkillLevel: String, Identifiable, CaseIterable {
    var id: Self { self }
    case beginner
    case novice
    case intermediate
    case advanced
    case expert
    case master
    case guru
}
