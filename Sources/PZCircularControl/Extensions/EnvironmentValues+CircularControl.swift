//
//  EnvironmentValues+CircularControl.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

extension EnvironmentValues {
    /// Controls whether the circular control allows continuous rotation past its start/end points.
    ///
    /// When `true`, the control allows the user to continuously rotate past the maximum value,
    /// wrapping back to zero, or past the minimum value, wrapping to maximum. When `false`,
    /// the control clamps at its minimum and maximum values.
    ///
    /// The default value is `false`.
    ///
    /// - Note: This setting only affects interactive controls where `isEditable` is `true`.
    @Entry public var circularControlAllowsWrapping: Bool = false
    
    /// Specifies the size of the control's drag knob relative to the stroke width.
    ///
    /// The knob size is calculated by multiplying this value with the control's stroke width.
    /// For example, a value of 1.4 makes the knob 40% larger than the stroke width.
    ///
    /// - Note: This setting only affects interactive controls where `isEditable` is `true`.
    @Entry public var circularControlKnobScale: CGFloat = 1.4
    
    /// Defines the animation used when the progress value changes programmatically.
    ///
    /// When set, this animation is applied to progress changes that occur through binding updates
    /// or direct property changes. It does not affect interactive changes made through dragging.
    ///
    /// The default value is `nil`, which means no animation is applied.
    @Entry public var circularControlProgressAnimation: Animation?
    
    /// The current progress value of the control, made available to child views.
    ///
    /// This value is automatically updated as the control's progress changes and can be
    /// read by child views (particularly custom labels) to respond to progress changes.
    ///
    /// The value is always normalized between 0 and 1.
    @Entry public var circularControlProgress: Double = 0
}

extension View {
    /// Configures whether circular controls in this view allow continuous rotation.
    ///
    /// Example:
    /// ```swift
    /// CircularControl(progress: $progress)
    ///     .circularControlAllowsWrapping(true)
    /// ```
    ///
    /// - Parameter allowsWrapping: Whether to allow continuous rotation past start/end points.
    /// - Returns: A view with the modified environment value.
    public func circularControlAllowsWrapping(_ allowsWrapping: Bool) -> some View {
        environment(\.circularControlAllowsWrapping, allowsWrapping)
    }
    
    /// Sets the size of the drag knob relative to the stroke width for circular controls in this view.
    ///
    /// Example:
    /// ```swift
    /// CircularControl(progress: $progress)
    ///     .circularControlKnobScale(2.0)
    /// ```
    ///
    /// - Parameter scale: The scale factor for the knob size relative to the stroke width.
    /// - Returns: A view with the modified environment value.
    public func circularControlKnobScale(_ scale: CGFloat) -> some View {
        environment(\.circularControlKnobScale, scale)
    }
    
    /// Sets the animation to use for progress changes in circular controls within this view.
    ///
    /// Example:
    /// ```swift
    /// CircularControl(progress: $progress)
    ///     .circularControlProgressAnimation(.snappy())
    /// ```
    ///
    /// - Parameter animation: The animation to apply to progress changes, or `nil` for no animation.
    /// - Returns: A view with the modified environment value.
    public func circularControlProgressAnimation(_ animation: Animation?) -> some View {
        environment(\.circularControlProgressAnimation, animation)
    }
}
