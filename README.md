# SolidDS

![Version](https://img.shields.io/badge/version-0.5.0-blue)
![Swift](https://img.shields.io/badge/Swift-6-orange)
![Platform](https://img.shields.io/badge/iOS-15%2B-blue)
![SPM](https://img.shields.io/badge/SPM-supported-brightgreen)
![License](https://img.shields.io/badge/license-MIT-green)
![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen)

A lightweight SwiftUI design system providing reusable components, design tokens, and UI primitives for building consistent apps.

## Features

- Reusable SwiftUI components
- Design tokens (colors, spacing, typography)
- Modular architecture
- Swift Package Manager support
- Demo catalog app

## Installation

Add the package using Swift Package Manager:

```swift
.package(url: "https://github.com/NikolaiBorisov/SolidDS.git", from: "0.5.0")
```

Or add it in Xcode:

File → Add Package Dependencies

```swift
https://github.com/NikolaiBorisov/SolidDS
```

## Highlight: SolidProgress

A highly customizable SwiftUI progress component supporting:

- Linear and circular styles
- Horizontal and vertical orientation
- Flexible value positioning (leading, trailing, top, bottom, overlay)
- Capsule and text value styles
- Customizable colors, spacing, and sizes
  
## Usage

```swift
import SolidDS

struct ContentView: View {
    var body: some View {
        SolidProgress(
            value: 0.77,
            valueFormat: .integer(percent: false),
            valueColor: .blue,
            progressType: .linear
        )
        .padding()
    }
}
```

## Components

- Progress indicators
- Reusable UI primitives

## Demo Screenshots

Here’s a preview of the `SolidProgress` component in action:

![SolidProgress Demo 1](Assets/Screenshots/img_1.jpeg)
![SolidProgress Demo 2](Assets/Screenshots/img_2.jpeg)
![SolidProgress Demo 3](Assets/Screenshots/img_3.jpeg)
![SolidProgress Demo 4](Assets/Screenshots/img_4.jpeg)
![SolidProgress Demo 5](Assets/Screenshots/img_5.jpeg)
![SolidProgress Demo 6](Assets/Screenshots/img_6.jpeg)

## Why SolidDS?

SolidDS helps you build consistent SwiftUI apps faster by providing 
ready-to-use components with flexible APIs and sensible defaults.

It’s designed to scale from simple apps to full design systems.
