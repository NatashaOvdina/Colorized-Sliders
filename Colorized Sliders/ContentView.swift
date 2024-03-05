//
//  ContentView.swift
//  Colorized Sliders
//
//  Created by Natalia Ovdina on 05.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color.mint
                .opacity(0.3)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                    RoundedRectangle(cornerRadius: 20)
                    .frame(height: 200)
                VStack(spacing: 1) {
                    ColoredSliderValue(sliderValue: $redSliderValue, color: .red)
                    ColoredSliderValue(sliderValue: $greenSliderValue, color: .green)
                    ColoredSliderValue(sliderValue: $blueSliderValue, color: .blue)
                }
            }
            .padding(EdgeInsets(top: 20, leading: 16, bottom: 200, trailing: 16))
        }
    }
}

#Preview {
    ContentView()
}

struct ColoredSliderValue: View {
    @Binding var sliderValue: Double
    
    let color: Color
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text(lround(sliderValue).formatted())
                    .font(.title3)
                    .frame(width: 35, height: 20)
                Slider(value: $sliderValue, in: 0...255, step: 1)
                    .tint(Color(color))
            }
        }
        .padding()
    }
}
