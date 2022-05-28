//
//  HapticManager.swift
//  ResearchProject
//
//  Created by Ko Kyaw on 27/05/2022.
//

import Foundation
import UIKit

class HapticManager {
    
    static let instance = HapticManager()
    
    private init() {}
    
    func generateImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
