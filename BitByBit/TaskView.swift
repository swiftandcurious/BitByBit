//
//  TaskView.swift
//  BitByBit
//
//  Created by swiftandcurious on 6/29/25.
//

import SwiftUI
import FoundationModels

struct TaskView: View {
    @State private var userInput = ""
    @State private var isLoading = false
    @State private var result: String? = nil
    @State private var temperature: Double = 1.0

    var body: some View {

            VStack(spacing: 20) {
                Text("Bit by Bit Companion")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                TextField("Your topic...", text: $userInput)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Temperature: ")
                        Spacer()
                        Text(String(format: "%.2f", temperature))
                    }
                    Slider(value: $temperature, in: 0.0...2.0)
                }
                .padding(.horizontal)

                Button {
                    Task {
                        isLoading = true
                        let response = try? await PromptManager.fetchBitByBit(for: userInput, temperature: temperature)
                        result = response ?? "No answer"
                        isLoading = false
                    }
                } label: {
                    Label("Ask", systemImage: "arrow.forward.circle.fill")
                        .font(.title2)
                        .padding()
                }
                .disabled(userInput.isEmpty)

                if isLoading {
                    ProgressView()
                }

                if let result = result {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(result)
                                .textSelection(.enabled)
                        }
                        .padding()
                    }
                    .padding()
                }

                Spacer()
            }
            .padding()
    }
    
}


#Preview {
    TaskView()
}
