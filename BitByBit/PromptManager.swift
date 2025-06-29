//
//  PromptManager.swift
//  BitByBit
//
//  Created by swiftandcurious on 6/29/25.
//

import SwiftUI
import FoundationModels

struct PromptManager {
    static func fetchBitByBit(for userPrompt: String, temperature: Double = 1.0) async throws -> String {
        
        let instructions = """
            Suggest a maximum of ten main steps to the topic provided to complete the task. Keep them concise (three to seven words) and make sure they build naturally from the person's topic.
            """
        
        let options = GenerationOptions(temperature: temperature)

        let session = LanguageModelSession(instructions: instructions)

        let response = try await session.respond(to: userPrompt, options: options)
        
        return response.content
    }
}
