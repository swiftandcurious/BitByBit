//
//  PromptTweak.swift
//  BitByBit
//
//  Created by swiftandcurious on 6/29/25.
//

import Playgrounds
import FoundationModels

#Playground {
    let session = LanguageModelSession(
        instructions: """
        Suggest a maximum of ten main steps to the topic provided to complete the task. Keep them concise (three to seven words) and make sure they build naturally from the person's topic.
        """
    )
    
    let options = GenerationOptions(temperature: 1.0)
    let prompt = "Making homemade bread"
    
    let response = try await session.respond(
        to: prompt,
        options: options
    )
    
}
