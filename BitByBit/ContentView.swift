//
//  ContentView.swift
//  BitByBit
//
//  Created by swiftandcurious on 6/29/25.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    // Create a reference to the system language model.
      private var model = SystemLanguageModel.default

      var body: some View {
          switch model.availability {
          case .available:
              TaskView()
          case .unavailable(.deviceNotEligible):
              Text("Device not eligible")
          case .unavailable(.appleIntelligenceNotEnabled):
              Text("Please enable Apple Intelligence in your device settings.")
          case .unavailable(.modelNotReady):
              Text("The model isn't ready because it's downloading or because of other system reasons.")
          case .unavailable(_):
              Text("The model is unavailable for an unknown reason.")
          }
      }
}

#Preview {
    ContentView()
}
