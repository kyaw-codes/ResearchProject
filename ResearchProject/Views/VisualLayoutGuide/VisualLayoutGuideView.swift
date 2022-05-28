//
//  VisualLayoutGuideView.swift
//  ResearchProject
//
//  Created by Ko Kyaw on 27/05/2022.
//

import SwiftUI

struct VisualLayoutGuideView: View {
    
    @State private var showHorizontalLayoutGuide = false
    @State private var showVerticalLayoutGuide = false
    
    @State private var rotationDegree: Double = 0.0
    
    @State private var previousOffset: CGSize = .zero
    @State private var currentOffset: CGSize = .zero
    
    @State private var previousScale: Double = 1.0
    @State private var currentScale: Double = 1.0
    
    var body: some View {
        ZStack {
            if showHorizontalLayoutGuide {
                horizontalLayoutGuide
            }
            
            if showVerticalLayoutGuide {
                verticalLayoutGuide
            }
            
            text
                .rotationEffect(.degrees(rotationDegree))
                .scaleEffect(currentScale)
                .offset(x: previousOffset.width + currentOffset.width, y: previousOffset.height + currentOffset.height)
                .gesture(rotationGesture.simultaneously(with: dragGesture).simultaneously(with: magnificationGesture))
        }
    }
    
    // MARK: - Views
    var text: some View {
        Text("Hello, World!")
            .font(.title.bold())
    }
    
    var horizontalLayoutGuide: some View {
        Rectangle()
            .foregroundColor(.cyan)
            .frame(width: UIScreen.main.bounds.width, height: 1)
    }
    
    var verticalLayoutGuide: some View {
        Rectangle()
            .foregroundColor(.cyan)
            .frame(width: 1, height: UIScreen.main.bounds.height)
    }
    
    // MARK: - Gestures
    var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { angle in
                rotationDegree = angle.degrees
            }
            .onEnded { _ in
                hideGuidelines()
            }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let width = previousOffset.width + currentOffset.width
                let height = previousOffset.height + currentOffset.height
                
                withAnimation {
                    showVerticalLayoutGuide = (-5 ... 5).contains(width)
                    showHorizontalLayoutGuide = (-5 ... 5).contains(height)
                }
                
                if (-1 ... 1).contains(width) || (-1 ... 1).contains(height) {
                    HapticManager.instance.generateImpactFeedback(style: .light)
                }
                
                currentOffset = value.translation
            }
            .onEnded { value in
                previousOffset.width += value.translation.width
                previousOffset.height += value.translation.height
                currentOffset = .zero
                hideGuidelines()
            }
    }
    
    var magnificationGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                let delta = value / previousScale
                currentScale *= delta
                previousScale = value
            }
            .onEnded { value in
                previousScale = 1.0
                hideGuidelines()
            }
    }
    
    private func hideGuidelines() {
        withAnimation {
            showVerticalLayoutGuide = false
            showHorizontalLayoutGuide = false
        }
    }
}

struct VisualLayoutGuideView_Previews: PreviewProvider {
    static var previews: some View {
        VisualLayoutGuideView()
    }
}
