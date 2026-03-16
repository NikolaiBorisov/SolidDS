//
//  SolidProgress.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 14.03.2026.
//

import SwiftUI

public struct SolidProgress<Style: ProgressViewStyle>: View {
    
    // MARK: Public configuration
    
    private let value: Double
    private let valueFormat: SolidProgressValueFormat
    private let orientation: SolidProgressOrientation
    private let size: SolidProgressSize
    private let style: SolidProgressStyle
    
    private let progressStyle: Style
    
    private let tint: Color
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
        style: SolidProgressStyle = .simple,
        tint: Color = .accentColor,
        progressStyle: Style,
        container: SolidProgressContainerStyle = .init(),
        
        topDivider: SolidProgressDivider? = nil,
        bottomDivider: SolidProgressDivider? = nil
    ) {
        self.value = min(max(value, 0), 1)
        self.valueFormat = valueFormat
        self.valueColor = valueColor
        
        self.orientation = orientation
        self.size = size
        self.style = style
        self.tint = tint
        self.progressStyle = progressStyle
        self.container = container
        
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
        
        HStack(spacing: spacing) {
            
            ProgressView(value: value)
                .progressViewStyle(progressStyle)
                .tint(tint)
                .frame(height: progressHeight)
            
            if style == .capsule {
                valueCapsule
            } else {
                valueText
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .animation(.easeInOut(duration: 0.25), value: formattedValue)
    }
    
    var valueText: some View {
        Text(formattedValue)
            .font(font)
            .foregroundStyle(valueColor)
    }
    
    var valueCapsule: some View {
        Text(formattedValue)
            .font(font)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Capsule().fill(tint.opacity(0.15)))
            .overlay(
                Capsule().stroke(tint.opacity(0.4), lineWidth: 1)
            )
            .foregroundStyle(valueColor)
            .animation(.easeInOut(duration: 0.25), value: formattedValue)
    }
    
    func dividerView(_ divider: SolidProgressDivider) -> some View {
        Rectangle()
            .fill(divider.color)
            .frame(height: divider.height)
            .padding(divider.padding)
    }
}

private extension SolidProgress {
    
    var progressHeight: CGFloat {
        switch size {
        case .small: return 4
        case .medium: return 6
        case .large: return 8
        }
    }
    
    var spacing: CGFloat {
        switch size {
        case .small: return 6
        case .medium: return 8
        case .large: return 10
        }
    }
    
    var font: Font {
        switch size {
        case .small: return .caption2.monospacedDigit()
        case .medium: return .caption.monospacedDigit()
        case .large: return .callout.monospacedDigit()
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

struct SolidProgress_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                // Simple progress view no %
                description(text: "Simple progress view no %")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: false),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: false),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 3, percent: false),
                    progressStyle: .linear
                )
                
                Divider().padding(.vertical)
                
                // Simple progress view with %
                description(text: "Simple progress view with %")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: true),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: true),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: true),
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 3, percent: true),
                    progressStyle: .linear
                )
                
                Divider().padding(.vertical)
                
                // Capsule progress view
                description(text: "Capsule progress view")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .integer(percent: false),
                    style: .capsule,
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                    style: .capsule,
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: true),
                    style: .capsule,
                    progressStyle: .linear
                )
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 2, percent: true),
                    style: .capsule,
                    progressStyle: .linear
                )
                
                // Card container progress view
                description(text: "Card container progress view")
                
                SolidProgress(
                    value: 0.77,
                    valueFormat: .decimal(places: 1, percent: false),
                    style: .capsule,
                    progressStyle: .linear,
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
                    style: .capsule,
                    progressStyle: .linear,
                    container: .init(
                        background: AnyShapeStyle(.regularMaterial),
                        cornerRadius: 16,
                        borderColor: .accentColor,
                        borderWidth: 1
                    ),
                    topDivider: nil,
                    bottomDivider: nil
                )
                
                Divider().padding(.vertical)
                
                SolidProgressDemo(controlType: .buttons)
                
                Divider().padding(.vertical)
                
                SolidProgressDemo(controlType: .slider)
                
                Divider().padding(.vertical)
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
            .padding(.leading, 20)
    }
}

struct SolidProgressDemo: View {
    
    enum ControlType {
        case buttons
        case slider
    }
    
    let controlType: ControlType
    
    @State private var progress: Double = 0.05
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            SolidProgress(
                value: progress,
                valueFormat: .decimal(places: 1, percent: true),
                style: .capsule,
                progressStyle: .linear
            )
            
            controls
        }
    }
    
    @ViewBuilder
    private var controls: some View {
        
        switch controlType {
            
        case .buttons:
            
            HStack(spacing: 20) {
                
                Button {
                    progress = max(progress - 0.05, 0)
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    progress = min(progress + 0.05, 1)
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
            }
            
        case .slider:
            
            Slider(value: $progress, in: 0...1)
        }
    }
}
