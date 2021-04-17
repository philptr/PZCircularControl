![Circular Control](https://github.com/philzet/PZCircularControl/blob/master/Resources/CircularControl.png)

# SwiftUI Circular Control

A custom circular progress bar made in SwiftUI.

## Features

* Highly customizable
* Animatable
* Updated to the latest syntax

## Usage

1. Install via Swift Package Manager
2. Create a `PZCircularControlParams` object to configure the style of your control (optional)
3. Instanciate a `PZCircularControl` and pass in the params

### Basic example

```swift
PZCircularControl(
    PZCircularControlParams(
        innerBackgroundColor: Color.clear,
        outerBackgroundColor: Color.gray.opacity(0.5),
        tintColor: LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
    )
)
```

This produces the following output:

![Output Image](https://github.com/philzet/PZCircularControl/blob/master/Resources/Example1.png)

The params object's instance data can be modified and animated. For example, the following code animates the control to the 35% state when the button is tapped:

```swift
PZExampleButton(label: "35%", font: .headline) { 
    withAnimation(.easeInOut(duration: 1.0)) { 
        control.params.progress = CGFloat(0.35) 
    } 
}
```

## More examples

### Dark background (see cover image)

```swift
PZCircularControl(
    PZCircularControlParams(
        innerBackgroundColor: Color.black,
        outerBackgroundColor: Color.black,
        tintColor: LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .bottomLeading, endPoint: .topLeading),
        textColor: .orange,
        barWidth: 24.0,
        glowDistance: 15.0,
        initialValue: CGFloat(Float.random(in: 0...1))
    )
)
```

### Purple text and gradient fill

```swift
PZCircularControl(
    PZCircularControlParams(
        innerBackgroundColor: Color.clear,
        outerBackgroundColor: Color.gray.opacity(0.5),
        tintColor: LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .bottomLeading, endPoint: .topLeading),
        textColor: .purple,
        barWidth: 30.0,
        glowDistance: 30.0,
        initialValue: CGFloat(Float.random(in: 0...1))
    )
)
```

![Output Image](https://github.com/philzet/PZCircularControl/blob/master/Resources/Example2.png)

## Customization

`PZCircularControlParams` object is accessible through the `params` instance field of a `PZCircularControl`. Any change to the instance will be reflected on the control automatically, without the need to refresh it or reload any data. 

Some customization options include:
* `progress` (accessible via `<<yourControlInstance>>.params.progress`) – the current progress the control displays (from 0.0 to 1.0, as `CGFloat`).
* `glowDistance` – the radius of the glow effect around the control (`CGFloat`). Set to 0.0 to remove the glow.
* `barWidth` – the width of the stroke of the control.
* `textColor` – the progress label color (as SwiftUI `Color`).
* `font` – the progress label font (as SwiftUI `Font`).
* `innerBackgroundColor` – the color of the inner part of your control (inner radius). Has to conform to `ShapeStyle` (ie. anything from `Color` to `Gradient`).
* `outerBackgroundColor` – the color of the active part's background. Has to conform to `ShapeStyle` (ie. anything from `Color` to `Gradient`).
* `tintColor` – the tint color of the active area of your control. Has to conform to `ShapeStyle` (ie. anything from `Color` to `Gradient`).
* `textFormatter` – an optional closure that takes in a CGFloat value of the current progress between 0.0 and 1.0 and returns formatted text that will be displayed in the center of the progress bar.

## License

MIT License

Copyright (c) 2019-2021 Phil Zet (a.k.a. Phil Zakharchenko)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
