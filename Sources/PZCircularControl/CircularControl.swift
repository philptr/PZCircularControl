//
//  CircularControl.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/6/19.
//

import SwiftUI

/// A circular progress control that supports rich customization of appearance and behavior.
///
/// `CircularControl` can be either static or interactive.
/// The control supports customizable appearance through generic style parameters and can display a built-in or custom label view
/// in its center.
public struct CircularControl<Label: View, TrackStyle: ShapeStyle, ProgressStyle: ShapeStyle, KnobStyle: ShapeStyle>: View {
    private let progress: Double
    private let isEditable: Bool
    private let strokeWidth: CGFloat
    private let strokeStyle: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle>
    private let label: Label
    private let onProgressChange: ((Double) -> Void)?
    
    @State private var currentProgress: Double
    
    @Environment(\.circularControlAllowsWrapping) private var allowsWrapping
    @Environment(\.circularControlKnobScale) private var knobScale
    
    /// Creates a circular control with the specified configuration.
    ///
    /// - Parameters:
    ///   - progress: The current progress value, between 0 and 1.
    ///   - isEditable: Whether the control responds to user interaction. Defaults to `false`.
    ///   - strokeWidth: The width of the progress track. Defaults to 20.
    ///   - style: The visual style configuration for the control.
    ///   - onProgressChange: A closure called when the progress value changes through user interaction.
    ///   - label: A view builder that creates the label view displayed in the center of the control.
    public init(
        progress: Double,
        isEditable: Bool = false,
        strokeWidth: CGFloat = .defaultStrokeWidth,
        style: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle> = .init(),
        onProgressChange: ((Double) -> Void)? = nil,
        @ViewBuilder label: () -> Label
    ) {
        let initialProgress = progress.clamped(to: 0...1)
        self.progress = initialProgress
        self._currentProgress = State(initialValue: initialProgress)
        self.isEditable = isEditable
        self.strokeWidth = strokeWidth
        self.strokeStyle = style
        self.onProgressChange = onProgressChange
        self.label = label()
    }
    
    /// Creates an editable circular control bound to a progress value.
    ///
    /// This initializer creates an interactive control that automatically updates the bound progress value
    /// when the user interacts with it. The control is always editable when created with this initializer.
    ///
    /// - Parameters:
    ///   - progress: A binding to the progress value, which will be clamped between 0 and 1.
    ///   - strokeWidth: The width of the progress track. Defaults to 20.
    ///   - style: The visual style configuration for the control.
    ///   - label: A view builder that creates the label view displayed in the center of the control.
    public init(
        progress: Binding<Double>,
        strokeWidth: CGFloat = .defaultStrokeWidth,
        style: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle> = .init(),
        @ViewBuilder label: () -> Label
    ) {
        let initialProgress = progress.wrappedValue.clamped(to: 0...1)
        self.progress = initialProgress
        self._currentProgress = State(initialValue: initialProgress)
        self.isEditable = true
        self.strokeWidth = strokeWidth
        self.strokeStyle = style
        self.onProgressChange = { newValue in
            progress.wrappedValue = newValue.clamped(to: 0...1)
        }
        self.label = label()
    }
    
    public var body: some View {
        Track(
            progress: currentProgress,
            isEditable: isEditable,
            strokeWidth: strokeWidth,
            style: strokeStyle,
            onProgressChange: { newProgress in
                currentProgress = newProgress
                onProgressChange?(newProgress)
            }
        )
        .overlay(
            label
                .environment(\.circularControlProgress, currentProgress)
        )
        .onChange(of: progress) { _, newValue in
            currentProgress = newValue.clamped(to: 0...1)
        }
    }
}

// MARK: - Default Label Convenience Initializer

extension CircularControl where Label == DefaultCircularControlLabel {
    /// Creates a circular control with a default progress label.
    ///
    /// This convenience initializer configures the control with a built-in label that formats
    /// the progress value according to the specified format.
    ///
    /// - Parameters:
    ///   - progress: The current progress value, between 0 and 1.
    ///   - isEditable: Whether the control responds to user interaction. Defaults to false.
    ///   - strokeWidth: The width of the progress track. Defaults to 20.
    ///   - style: The visual style configuration for the control.
    ///   - format: The format to use for displaying the progress value. Defaults to percentage.
    ///   - onProgressChange: A closure called when the progress value changes through user interaction.
    public init(
        progress: Double,
        isEditable: Bool = false,
        strokeWidth: CGFloat = .defaultStrokeWidth,
        style: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle> = .init(),
        format: CircularControlLabelFormat = .percentage,
        onProgressChange: ((Double) -> Void)? = nil
    ) {
        self.init(
            progress: progress,
            isEditable: isEditable,
            strokeWidth: strokeWidth,
            style: style,
            onProgressChange: onProgressChange
        ) {
            DefaultCircularControlLabel(format: format)
        }
    }
    
    /// Creates an editable circular control with a default percentage label bound to a progress value.
    ///
    /// This convenience initializer creates an interactive control with a built-in label that formats
    /// the progress value according to the specified format. The control is always editable when created
    /// with this initializer.
    ///
    /// - Parameters:
    ///   - progress: A binding to the progress value, which will be clamped between 0 and 1.
    ///   - strokeWidth: The width of the progress track. Defaults to 20.
    ///   - style: The visual style configuration for the control.
    ///   - format: The format to use for displaying the progress value. Defaults to percentage.
    public init(
        progress: Binding<Double>,
        strokeWidth: CGFloat = .defaultStrokeWidth,
        style: CircularControlStyle<TrackStyle, ProgressStyle, KnobStyle> = .init(),
        format: CircularControlLabelFormat = .percentage
    ) {
        self.init(
            progress: progress,
            strokeWidth: strokeWidth,
            style: style
        ) {
            DefaultCircularControlLabel(format: format)
        }
    }
}

extension CGFloat {
    @usableFromInline
    static let defaultStrokeWidth: CGFloat = 20
}

// MARK: - Xcode Previews

#Preview {
    VStack {
        CircularControl(
            progress: 0.7,
            isEditable: true,
            style: .init(
                track: Color.indigo.opacity(0.2),
                progress: LinearGradient(
                    colors: [.indigo, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                shadow: .init(color: .purple.opacity(0.3), radius: 10)
            )
        ) { progress in
            print("Progress changed to: \(progress)")
        }
        .circularControlAllowsWrapping(false)
        
        CircularControl(
            progress: 0.4,
            strokeWidth: 25,
            style: .init(
                track: Color.orange.opacity(0.2),
                progress: Color.orange
            )
        ) {
            VStack {
                Image(systemName: "star.fill")
                    .font(.title)
                Text("40%")
                    .font(.headline)
            }
            .foregroundStyle(.orange)
        }
    }
    .padding()
}
