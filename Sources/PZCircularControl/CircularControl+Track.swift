//
//  CircularControl+Track.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

extension CircularControl {
    struct Track: View {
        @Environment(\.circularControlAllowsWrapping) private var allowsWrapping
        @Environment(\.circularControlKnobScale) private var knobScale
        
        let progress: Double
        let isEditable: Bool
        let strokeWidth: CGFloat
        let style: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle>
        let onProgressChange: ((Double) -> Void)?
        
        @State private var currentProgress: Double = 0
        @State private var currentAngle: Double?
        @State private var isDragging = false
        
        @Environment(\.isEnabled) private var isEnabled
        @Environment(\.circularControlProgressAnimation) private var progressAnimation
        
        var body: some View {
            GeometryReader { geometry in
                let size = min(geometry.size.width, geometry.size.height)
                let center = CGPoint(x: size / 2, y: size / 2)
                let radius = (size - strokeWidth) / 2
                
                ZStack {
                    backgroundTrack
                    progressView
                    
                    if isEditable {
                        let position = knobPosition(for: currentProgress, radius: radius)
                        Knob(style: style.knob, position: position, isDragging: $isDragging)
                            .frame(width: strokeWidth * knobScale, height: strokeWidth * knobScale)
                            .position(
                                x: center.x + position.x,
                                y: center.y + position.y
                            )
                            .animation(nil, value: currentProgress)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            handleDrag(value, in: geometry.size)
                        }
                        .onEnded { value in
                            handleDrag(value, in: geometry.size)
                            
                            isDragging = false
                            currentAngle = nil
                        },
                    isEnabled: isEditable && isEnabled
                )
            }
            .aspectRatio(1, contentMode: .fit)
            .padding(strokeWidth / 2)
            .onChange(of: progress) { oldValue, newValue in
                if !isDragging {
                    withAnimation(progressAnimation) {
                        currentProgress = newValue
                    }
                }
            }
            .onAppear {
                withAnimation(progressAnimation) {
                    currentProgress = progress
                }
            }
        }
        
        private var backgroundTrack: some View {
            Circle()
                .stroke(style.track, lineWidth: strokeWidth)
        }
        
        private var progressView: some View {
            Circle()
                .trim(from: 0, to: currentProgress)
                .stroke(
                    style.progress,
                    style: StrokeStyle(
                        lineWidth: strokeWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .shadow(
                    color: style.shadow?.color ?? .clear,
                    radius: style.shadow?.radius ?? 0
                )
        }
        
        private func knobPosition(for progress: Double, radius: CGFloat) -> CGPoint {
            let angle = Double.pi * 2 * progress - Double.pi / 2
            return CGPoint(
                x: CoreGraphics.cos(angle) * (radius + strokeWidth/2),
                y: CoreGraphics.sin(angle) * (radius + strokeWidth/2)
            )
        }
        
        private func handleDrag(_ value: DragGesture.Value, in size: CGSize) {
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let location = value.location
            let angle = atan2(location.y - center.y, location.x - center.x)
            
            var progress = (angle + .pi / 2) / (.pi * 2)
            if progress < 0 {
                progress += 1
            }
            
            if !isDragging {
                isDragging = true
                currentAngle = progress
#if os(iOS)
                HapticFeedback.selection.play()
#endif
            }
            
            if let currentAngle {
                let delta = progress - currentAngle
                let isIncreasing = delta > 0
                
                // Handle wrapping
                if !allowsWrapping {
                    if abs(delta) > 0.5 {
                        // User dragged across the boundary
                        if isIncreasing {
                            // Trying to wrap from end to start
                            progress = 0
                        } else {
                            // Trying to wrap from start to end
                            progress = 1
                        }
                    } else {
                        let candidateProgress = currentProgress + delta
                        if isIncreasing {
                            progress = min(candidateProgress, 1)
                        } else {
                            progress = max(candidateProgress, 0)
                        }
                    }
                } else if abs(delta) > 0.5 {
                    // Adjust for wraparound
                    if delta > 0 {
                        progress -= 1
                    } else {
                        progress += 1
                    }
                }
            }
            
            self.currentAngle = progress
            
#if os(iOS)
            if abs(progress - currentProgress) > 0.05 {
                HapticFeedback.light.play()
            }
#endif
            
            currentProgress = progress
            onProgressChange?(currentProgress)
        }
    }
}
