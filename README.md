# SolidDS

![Version](https://img.shields.io/badge/version-0.1.1-blue)
![Swift](https://img.shields.io/badge/Swift-6-orange)
![Platform](https://img.shields.io/badge/iOS-15%2B-blue)
![SPM](https://img.shields.io/badge/SPM-supported-brightgreen)
![License](https://img.shields.io/badge/license-MIT-green)

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
.package(url: "https://github.com/NikolaiBorisov/SolidDS.git", from: "0.1.1")
```

Or add it in Xcode:

File → Add Package Dependencies

https://github.com/NikolaiBorisov/SolidDS.git

## Usage

```swift
import SolidDS

struct ContentView: View {
    var body: some View {
        SolidProgress(
            progress: 0.75,
            progressColor: .blue
        )
        .frame(height: 12)
        .padding()
    }
}
```

## Components

- Progress indicators
- Reusable UI primitives
