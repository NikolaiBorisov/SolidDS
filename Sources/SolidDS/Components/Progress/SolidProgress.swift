//
//  SolidProgress.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 14.03.2026.
//

import SwiftUI

public struct SolidProgress: View {
    
    public enum ProgressDefaults {
        
        public static var progressPadding: EdgeInsets {
            EdgeInsets(
                top: 6,
                leading: 8,
                bottom: 6,
                trailing: 8
            )
        }
        
        public static var capsulePadding: EdgeInsets {
            EdgeInsets(
                top: 4,
                leading: 8,
                bottom: 4,
                trailing: 8
            )
        }
    }
    
    // MARK: Public configuration
    
    private let value: Double
    private let valueFormat: SolidProgressValueFormat
    private let orientation: SolidProgressOrientation
    private let size: SolidProgressSize
    private let valueStyle: SolidProgressValueStyle
    private let progressType: SolidProgressType
    
    private let progressPadding: EdgeInsets
    private let customContentSpacing: CGFloat?
    private let customProgressContainerHeight: CGFloat?
    private let progressTrackHeight: CGFloat
    private let progressTrackColor: Color
    private let customFont: Font?
    
    private let capsulePadding: EdgeInsets
    private let capsuleBgColor: Color
    private let capsuleBorderColor: Color
    private let capsuleBorderWidth: CGFloat
    
    private let customCircularScale: CGFloat?
    private let customCircularContainerSize: CGFloat?
    
    private let progressTint: Color
    private let valueColor: Color
    
    private let container: SolidProgressContainerStyle
    
    private let topDivider: SolidProgressDivider?
    private let bottomDivider: SolidProgressDivider?
    
    // MARK: Init
    
    public init(
        value: Double,
        valueFormat: SolidProgressValueFormat = .integer(percent: true),
        valueColor: Color = .primary,
        
        orientation: SolidProgressOrientation = .horizontal,
        size: SolidProgressSize = .medium,
        valueStyle: SolidProgressValueStyle = .simple,
        progressTint: Color = .accentColor,
        progressType: SolidProgressType = .linear,
        container: SolidProgressContainerStyle = .init(),
        
        progressPadding: EdgeInsets = ProgressDefaults.progressPadding,
        customContentSpacing: CGFloat? = nil,
        customProgressContainerHeight: CGFloat? = nil,
        progressTrackHeight: CGFloat = 6,
        progressTrackColor: Color = Color.secondary.opacity(0.2),
        customFont: Font? = nil,
        
        capsulePadding: EdgeInsets = ProgressDefaults.capsulePadding,
        capsuleBgColor: Color = .secondary.opacity(0.15),
        capsuleBorderColor: Color = .accentColor,
        capsuleBorderWidth: CGFloat = 1,
        
        customCircularScale: CGFloat? = 1,
        customCircularContainerSize: CGFloat? = nil,
        
        topDivider: SolidProgressDivider? = nil,
        bottomDivider: SolidProgressDivider? = nil
    ) {
        // Clamp progress value to valid range 0...1
        self.value = min(max(value, 0), 1)
        self.valueFormat = valueFormat
        self.valueColor = valueColor
        
        self.orientation = orientation
        self.size = size
        self.valueStyle = valueStyle
        self.progressTint = progressTint
        self.progressType = progressType
        self.container = container
        
        self.progressPadding = progressPadding
        self.customContentSpacing = customContentSpacing
        self.customProgressContainerHeight = customProgressContainerHeight
        self.progressTrackHeight = progressTrackHeight
        self.progressTrackColor = progressTrackColor
        self.customFont = customFont
        
        self.capsulePadding = capsulePadding
        self.capsuleBgColor = capsuleBgColor
        self.capsuleBorderColor = capsuleBorderColor
        self.capsuleBorderWidth = capsuleBorderWidth
        
        self.customCircularScale = customCircularScale
        self.customCircularContainerSize = customCircularContainerSize
        
        self.topDivider = topDivider
        self.bottomDivider = bottomDivider
    }
    
    // MARK: Body
    
    public var body: some View {
        
        VStack(spacing: 0) {
            content
        }
        .background(container.background)
        .clipShape(RoundedRectangle(cornerRadius: container.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: container.cornerRadius)
                .stroke(
                    container.borderColor ?? .clear,
                    lineWidth: container.borderWidth
                )
        )
        .overlay(alignment: .top) {
            if let divider = topDivider {
                dividerView(divider)
            }
        }
        .overlay(alignment: .bottom) {
            if let divider = bottomDivider {
                dividerView(divider)
            }
        }
    }
}

private extension SolidProgress {
    
    var content: some View {
        
        HStack(spacing: contentSpacing) {
            
            switch progressType {
                
            case .linear:
                SolidProgressTrack(
                    progress: value,
                    height: progressTrackHeight,
                    tint: progressTint,
                    trackColor: progressTrackColor
                )
                
            case .circular:
                ProgressView(value: value)
                    .progressViewStyle(.circular)
                    .tint(progressTint)
                    .frame(
                        width: circularContainerSize,
                        height: circularContainerSize
                    )
                    .scaleEffect(circularScale)
            }
            
            if progressType == .linear {
                if valueStyle == .capsule {
                    valueCapsule
                } else {
                    valueText
                }
            }
        }
        .padding(progressPadding)
        .animation(.easeInOut(duration: 0.25), value: value)
    }
    
    var valueText: some View {
        Text(formattedValue)
            .font(font)
            .foregroundStyle(valueColor)
    }
    
    var valueCapsule: some View {
        Text(formattedValue)
            .font(font)
            .padding(capsulePadding)
            .background(Capsule().fill(capsuleBgColor))
            .overlay(
                Capsule().stroke(
                    capsuleBorderColor,
                    lineWidth: capsuleBorderWidth
                )
            )
            .foregroundStyle(valueColor)
            .animation(.easeInOut(duration: 0.25), value: value)
    }
    
    func dividerView(_ divider: SolidProgressDivider) -> some View {
        Rectangle()
            .fill(divider.color)
            .frame(height: divider.height)
            .padding(divider.padding)
    }
}

private extension SolidProgress {
    
    var progressContainerHeight: CGFloat {
        customProgressContainerHeight ?? defaultProgressContainerHeight
    }
    
    var defaultProgressContainerHeight: CGFloat {
        switch size {
        case .small: return 4
        case .medium: return 6
        case .large: return 8
        }
    }
    
    var contentSpacing: CGFloat {
        customContentSpacing ?? defaultContentSpacing
    }
    
    var defaultContentSpacing: CGFloat {
        switch size {
        case .small: return 6
        case .medium: return 8
        case .large: return 10
        }
    }
    
    var font: Font {
        customFont ?? defaultFont
    }
    
    var defaultFont: Font {
        switch size {
        case .small: return .caption2.monospacedDigit()
        case .medium: return .caption.monospacedDigit()
        case .large: return .callout.monospacedDigit()
        }
    }
    
    var circularContainerSize: CGFloat {
        customCircularContainerSize ?? defaultCircularContainerSize
    }
    
    var defaultCircularContainerSize: CGFloat {
        switch size {
        case .small: return 20
        case .medium: return 28
        case .large: return 36
        }
    }
    
    var circularScale: CGFloat {
        customCircularScale ?? defaultCircularScale
    }
    
    var defaultCircularScale: CGFloat {
        switch size {
        case .small: return 0.8
        case .medium: return 1.0
        case .large: return 1.3
        }
    }
}

private extension SolidProgress {
    
    var formattedValue: String {
        
        switch valueFormat {
            
        case .none:
            return ""
            
        case .integer(let percent):
            
            let number = Int(value * 100)
            return percent ? "\(number)%" : "\(number)"
            
        case .decimal(let places, let percent, let separator):
            
            let formatter = NumberFormatter()
            
            formatter.minimumFractionDigits = places
            formatter.maximumFractionDigits = places
            
            switch separator {
                
            case .locale:
                break
                
            case .dot:
                formatter.locale = Locale(identifier: "en_US_POSIX")
                
            case .comma:
                formatter.locale = Locale(identifier: "fr_FR")
            }
            
            let number = value * 100
            let string = formatter.string(from: NSNumber(value: number)) ?? "\(number)"
            
            return percent ? "\(string)%" : string
            
        case .custom(let formatter):
            
            return formatter(value)
        }
    }
}

private extension SolidProgress {
    struct SolidProgressTrack: View {
        
        var progress: Double
        var height: CGFloat
        var tint: Color
        var trackColor: Color
        
        var body: some View {
            
            GeometryReader { geo in
                
                Capsule()
                    .fill(trackColor)
                    .overlay(alignment: .leading) {
                        Capsule()
                            .fill(tint)
                            .frame(width: geo.size.width * progress)
                    }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .clipped()
        }
    }
}

struct SolidProgress_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                // Simple progress view no %
                description(text: "Simple progress view no %")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: false),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: false),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 3, percent: false),
                )
                
                Divider().padding(.vertical)
                
                // Simple progress view with %
                description(text: "Simple progress view with %")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: true),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: true),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: true),
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 3, percent: true),
                )
                
                Divider().padding(.vertical)
                
                // Capsule progress view
                description(text: "Capsule progress view")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: false),
                    valueStyle: .capsule,
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                    valueStyle: .capsule,
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: true),
                    valueStyle: .capsule,
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: true),
                    valueStyle: .capsule,
                )
                
                // Card container progress view
                description(text: "Card container progress view")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                    valueStyle: .capsule,
                    container: .init(
                        background: AnyShapeStyle(.regularMaterial),
                        cornerRadius: 16,
                        borderColor: .accentColor,
                        borderWidth: 1
                    ),
                    topDivider: .init(
                        color: .clear,
                        height: 0,
                        padding: .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                    ),
                    bottomDivider: .init(
                        color: .clear,
                        height: 0,
                        padding: .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                    )
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: true),
                    valueStyle: .capsule,
                    container: .init(
                        background: AnyShapeStyle(.regularMaterial),
                        cornerRadius: 16,
                        borderColor: .accentColor,
                        borderWidth: 1
                    ),
                    capsuleBgColor: .green,
                    topDivider: nil,
                    bottomDivider: nil
                )
                
                Divider().padding(.vertical)
                
                // Circular progress view
                VStack(spacing: 16) {
                    
                    description(text: "Circular progress view")
                    
                    SolidProgress(
                        value: 0.0,
                        progressTint: .red,
                        progressType: .circular,
                        customCircularScale: 0.5
                    )
                    
                    SolidProgress(
                        value: 0.0,
                        progressTint: .green,
                        progressType: .circular,
                        container: .init(
                            background: AnyShapeStyle(.secondary),
                            cornerRadius: 20,
                            borderColor: .primary,
                            borderWidth: 1
                        ),
                        customCircularScale: 1.0
                    )
                    
                    SolidProgress(
                        value: 0.0,
                        progressTint: .blue,
                        progressType: .circular,
                        customCircularScale: 2
                    )
                }
            }
            .padding()
        }
    }
    
    static func description(text: String) -> some View {
        Text(text)
            .textCase(.uppercase)
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.secondary)
            .padding(.leading, 8)
    }
}
