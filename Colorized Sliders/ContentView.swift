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
            Color.gray
                .opacity(0.4)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                ColorView(
                    redSliderValue: $redSliderValue,
                    greenSliderValue: $greenSliderValue,
                    blueSliderValue: $blueSliderValue
                )
                VStack(spacing: 25) {
                    SliderValueView(sliderValue: $redSliderValue, color: .red)
                    SliderValueView(sliderValue: $greenSliderValue, color: .green)
                    SliderValueView(sliderValue: $blueSliderValue, color: .blue)
                }
            }
            .padding(EdgeInsets(top: 20, leading: 16, bottom: 250, trailing: 16))
        }
    }
    
}

#Preview {
    ContentView()
}

struct SliderValueView: View {
    @Binding var sliderValue: Double
    
    let color: Color
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text(lround(sliderValue).formatted())
                    .font(.title3)
                    .frame(width: 38, height: 20)
                Slider(value: $sliderValue, in: 0...255, step: 1)
                    .tint(Color(color))
            }
        }
    }
}

struct ColorView: View {
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    
    var body: some View {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
        .ignoresSafeArea()
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 4))
        
    }
}
