//
//  SolidProgress.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 14.03.2026.
//

import SwiftUI

/// A customizable progress component supporting linear and circular styles.
public struct SolidProgress: View {
    
    // MARK: - Input Properties (core data)
    private let value: Double
    private let valueFormat: SolidProgressValueFormat
    
    // MARK: - Configuration (behavior & layout)
    private let orientation: SolidProgressOrientation
    private let size: SolidProgressSize
    
    // MARK: - Styles (visual systems)
    private let progressStyle: SolidProgressStyle
    private let container: SolidProgressContainerStyle
    private let capsule: SolidProgressCapsuleStyle
    private let valuePosition: SolidProgressValuePosition
    private let valueStyle: SolidProgressValueStyle
    private let valueColor: Color
    
    // MARK: - Layout Customization (overrides / fine-tuning)
    private let customContentSpacing: CGFloat?
    private let customProgressContainerHeight: CGFloat?
    
    // MARK: - Variant-Specific (circular)
    private let customCircularScale: CGFloat?
    private let customCircularContainerSize: CGFloat?
    
    // MARK: - Typography
    private let customFont: Font?
    
    // MARK: - Accessories (optional extras)
    private let topDivider: SolidProgressDivider?
    private let bottomDivider: SolidProgressDivider?
    
    private let formatter = NumberFormatter()
    
    // MARK: - Init
    public init(
        value: Double,
        valueFormat: SolidProgressValueFormat = .integer(percent: true),
        
        orientation: SolidProgressOrientation = .horizontal,
        size: SolidProgressSize = .medium,
        
        progressStyle: SolidProgressStyle = .init(),
        container: SolidProgressContainerStyle = .init(),
        capsule: SolidProgressCapsuleStyle = .init(),
        valuePosition: SolidProgressValuePosition = .trailing,
        valueStyle: SolidProgressValueStyle = .simple,
        valueColor: Color = .primary,
        
        customContentSpacing: CGFloat? = nil,
        customProgressContainerHeight: CGFloat? = nil,
        
        customCircularScale: CGFloat? = 1,
        customCircularContainerSize: CGFloat? = nil,
        
        customFont: Font? = nil,
        
        topDivider: SolidProgressDivider? = nil,
        bottomDivider: SolidProgressDivider? = nil
    ) {
        // Clamp progress value to valid range 0...1
        self.value = min(max(value, 0), 1)
        self.valueFormat = valueFormat
        
        self.orientation = orientation
        self.size = size
        
        self.progressStyle = progressStyle
        self.container = container
        self.capsule = capsule
        self.valuePosition = valuePosition
        self.valueStyle = valueStyle
        self.valueColor = valueColor
        
        self.customContentSpacing = customContentSpacing
        self.customProgressContainerHeight = customProgressContainerHeight
        
        self.customCircularScale = customCircularScale
        self.customCircularContainerSize = customCircularContainerSize
        
        self.customFont = customFont
        
        self.topDivider = topDivider
        self.bottomDivider = bottomDivider
    }
    
    // MARK: - Body
    public var body: some View {
        
        VStack(spacing: 0) {
            content
        }
        .background(
            ZStack {
                Group {
                    switch container.glassStyle {
                    case .none:
                        RoundedRectangle(cornerRadius: container.cornerRadius)
                            .fill(container.background)
                        
                    case .ultraThin:
                        RoundedRectangle(cornerRadius: container.cornerRadius)
                            .fill(container.background)
                            .overlay(
                                RoundedRectangle(cornerRadius: container.cornerRadius)
                                    .fill(
                                        LinearGradient(
                                            colors: container.glassColors ?? [
                                                Color.white.opacity(0.25),
                                                Color.white.opacity(0.05)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            )
                    }
                }
                
                if let image = container.backgroundImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: container.cornerRadius))
                        .opacity(0.9)
                }
            }
        )
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

// MARK: - Subcomponents

extension SolidProgress {
    
    var content: some View {
        Group {
            if orientation == .horizontal {
                horizontalLayout
            } else {
                verticalLayout
            }
        }
        .padding(progressStyle.padding)
        .animation(.easeInOut(duration: 0.25), value: value)
    }
    
    var horizontalLayout: some View {
        Group {
            switch valuePosition {
            case .leading:
                HStack(spacing: contentSpacing) {
                    valueView
                    progressView
                }
            case .trailing:
                HStack(spacing: contentSpacing) {
                    progressView
                    valueView
                }
            case .top:
                VStack(spacing: contentSpacing) {
                    valueView
                    progressView
                }
            case .bottom:
                VStack(spacing: contentSpacing) {
                    progressView
                    valueView
                }
            case .overlayLeading:
                ZStack(alignment: .leading) {
                    progressView
                    valueView
                }
            case .overlayTrailing:
                ZStack(alignment: .trailing) {
                    progressView
                    valueView
                }
            case .overlayCenter:
                ZStack {
                    progressView
                    valueView
                }
            }
        }
    }
    
    var verticalLayout: some View {
        Group {
            switch valuePosition {
                
            case .top:
                VStack(spacing: contentSpacing) {
                    valueView
                    progressView
                }
                
            case .bottom:
                VStack(spacing: contentSpacing) {
                    progressView
                    valueView
                }
                
            case .leading: // LEFT of vertical bar
                HStack(spacing: contentSpacing) {
                    valueView
                    progressView
                        .frame(width: progressStyle.trackHeight)
                }
                
            case .trailing: // RIGHT of vertical bar
                HStack(spacing: contentSpacing) {
                    progressView
                        .frame(width: progressStyle.trackHeight)
                    valueView
                }
                
            case .overlayLeading:
                ZStack(alignment: .leading) {
                    progressView
                    valueView
                }
                
            case .overlayTrailing:
                ZStack(alignment: .trailing) {
                    progressView
                    valueView
                }
                
            case .overlayCenter:
                ZStack {
                    progressView
                    valueView
                }
            }
        }
    }
    
    var valueView: some View {
        Group {
            if valueStyle == .capsule {
                valueCapsule
            } else {
                valueText
            }
        }
    }
    
    var progressView: some View {
        Group {
            switch progressStyle.type {
                
            case .linear:
                LinearProgressTrack(
                    progress: value,
                    height: progressStyle.trackHeight,
                    tint: progressStyle.tint,
                    trackColor: progressStyle.trackColor
                )
                .rotationEffect(orientation == .vertical ? .degrees(-90) : .degrees(0))
                .frame(
                    maxWidth: orientation == .horizontal ? .infinity : nil
                )
                .frame(
                    width: orientation == .vertical ? customProgressContainerHeight : nil,
                    height: orientation == .vertical
                    ? (customProgressContainerHeight ?? defaultVerticalHeight)
                    : progressContainerHeight
                )
                
            case .circular:
                ProgressView(value: value)
                    .progressViewStyle(.circular)
                    .tint(progressStyle.tint)
                    .frame(
                        width: circularContainerSize,
                        height: circularContainerSize
                    )
                    .scaleEffect(circularScale)
            }
        }
    }
    
    var valueText: some View {
        Text(formattedValue)
            .font(font)
            .foregroundStyle(valueColor)
    }
    
    var valueCapsule: some View {
        Text(formattedValue)
            .font(font)
            .padding(capsule.padding)
            .background(
                Capsule()
                    .fill(capsule.background)
                    .overlay(
                        // Glass effect on top of fill
                        Group {
                            if capsule.glassStyle == .ultraThin {
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: capsule.glassColors ?? [
                                                Color.white.opacity(0.25),
                                                Color.white.opacity(0.05)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                        }
                    )
                    .background(
                        // Image behind fill, clipped to capsule frame
                        GeometryReader { geo in
                            if let image = capsule.backgroundImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width, height: geo.size.height)
                                    .clipShape(Capsule())
                            }
                        }
                    )
            )
            .overlay(
                // Border on top
                Capsule()
                    .stroke(
                        capsule.border.color,
                        lineWidth: capsule.border.width
                    )
            )
            .foregroundStyle(valueColor)
    }
    
    func dividerView(_ divider: SolidProgressDivider) -> some View {
        Rectangle()
            .fill(divider.color)
            .frame(height: divider.height)
            .padding(divider.padding)
    }
}

private extension SolidProgress {
    // MARK: - Layout Computations
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
    
    var defaultVerticalHeight: CGFloat {
        switch size {
        case .small: return 40
        case .medium: return 60
        case .large: return 80
        }
    }
    
    // MARK: - Typography
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
    
    // MARK: - Circular Config
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

// MARK: - Formatting
private extension SolidProgress {
    
    var formattedValue: String {
        
        switch valueFormat {
            
        case .none:
            return ""
            
        case .integer(let percent):
            
            let number = Int(value * 100)
            return percent ? "\(number)%" : "\(number)"
            
        case .decimal(let places, let percent, let separator):
            
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
            let string = formatter
                .string(from: NSNumber(value: number)) ?? "\(number)"
            
            return percent ? "\(string)%" : string
            
        case .custom(let formatter):
            
            return formatter(value)
        }
    }
}

// MARK: - Previews
struct SolidProgress_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Section("Simple progress view no %") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .integer(percent: false)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 1, percent: false)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 2, percent: false)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 3 places") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 3, percent: false)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Simple progress view with %") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .integer(percent: true)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 1, percent: true)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 2, percent: true)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 3 places") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 3, percent: true)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Capsule progress view") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .integer(percent: false),
                            valueStyle: .capsule
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 1, percent: false),
                            valueStyle: .capsule
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places with %") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 2, percent: true),
                            valueStyle: .capsule
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("UltraThinMaterial") {
                        VStack {
                            SolidProgress(
                                value: 0.77,
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    border: .init(color: AnyShapeStyle(Color.accentColor), width: 1),
                                    glassStyle: .ultraThin
                                ),
                                valueStyle: .capsule,
                            )
                            SolidProgress(
                                value: 0.77,
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                    glassStyle: .ultraThin,
                                    glassColors: [
                                        Color.red.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ]
                                ),
                                valueStyle: .capsule
                            )
                        }
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Capsule BG Image") {
                        SolidProgress(
                            value: 0.77,
                            capsule: .init(
                                background: AnyShapeStyle(.clear),
                                backgroundImage: Image(.progressBgImg),
                                border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                glassStyle: .none
                            ),
                            valueStyle: .capsule,
                            valueColor: .black
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Card container progress view") {
                    NavigationLink("Clear") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 1, percent: false),
                            container: .init(
                                background: AnyShapeStyle(.clear),
                                cornerRadius: 16,
                                borderColor: .accentColor,
                                borderWidth: 1,
                                glassStyle: .none
                            ),
                            valueStyle: .capsule,
                            topDivider: nil,
                            bottomDivider: nil
                        )
                        .padding()
                        Spacer()
                    }
                    NavigationLink("RegularMaterial") {
                        SolidProgress(
                            value: 0.77,
                            valueFormat: .decimal(places: 2, percent: true),
                            container: .init(
                                background: AnyShapeStyle(.regularMaterial),
                                cornerRadius: 16,
                                borderColor: .accentColor,
                                borderWidth: 1,
                                glassStyle: .none
                            ),
                            capsule: .init(
                                background: AnyShapeStyle(.green)
                            ),
                            valueStyle: .capsule
                        )
                        .padding()
                        Spacer()
                    }
                    NavigationLink("UltraThinMaterial") {
                        VStack {
                            SolidProgress(
                                value: 0.77,
                                valueFormat: .decimal(places: 3, percent: true),
                                container: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    cornerRadius: 16,
                                    borderColor: .accentColor,
                                    borderWidth: 1,
                                    glassStyle: .ultraThin
                                ),
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    glassStyle: .ultraThin
                                ),
                                valueStyle: .capsule
                            )
                            SolidProgress(
                                value: 0.88,
                                valueFormat: .decimal(places: 2, percent: true),
                                container: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    cornerRadius: 16,
                                    borderColor: .accentColor,
                                    borderWidth: 1,
                                    glassStyle: .ultraThin,
                                    glassColors: [
                                        Color.red.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ]
                                ),
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    glassStyle: .ultraThin,
                                    glassColors: [
                                        Color.red.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ]
                                ),
                                valueStyle: .capsule
                            )
                        }
                        .padding()
                        Spacer()
                    }
                    NavigationLink("BG Image") {
                        VStack {
                            SolidProgress(
                                value: 0.77,
                                valueFormat: .decimal(places: 3, percent: true),
                                progressStyle: .init(
                                    type: .linear,
                                    tint: .accentColor,
                                    trackColor: .gray,
                                    trackHeight: 4,
                                    padding: .init(top: 6, leading: 8, bottom: 6, trailing: 8)
                                ),
                                container: .init(
                                    background: AnyShapeStyle(.regularMaterial),
                                    backgroundImage: Image(.progressBgImg),
                                    cornerRadius: 16,
                                    borderColor: .accentColor,
                                    borderWidth: 1,
                                    glassStyle: .none
                                ),
                                capsule: .init(
                                    background: AnyShapeStyle(.regularMaterial),
                                    glassStyle: .none
                                ),
                                valueStyle: .capsule
                            )
                            
                            
                            SolidProgress(
                                value: 0.77,
                                capsule: .init(
                                    background: AnyShapeStyle(.clear),
                                    backgroundImage: Image(.progressBgImg),
                                    border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                    glassStyle: .none
                                ),
                                valueStyle: .capsule,
                                valueColor: .black
                            )
                        }
                        .padding()
                        Spacer()
                    }
                }
                
                Section("Vertical progress view") {
                    NavigationLink("Vertical leading") {
                        SolidProgress(
                            value: 0.5,
                            orientation: .vertical,
                            valuePosition: .leading,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical trailing") {
                        SolidProgress(
                            value: 0.5,
                            orientation: .vertical,
                            valuePosition: .trailing,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical overlayCenter") {
                        SolidProgress(
                            value: 0.5,
                            orientation: .vertical,
                            capsule: .init(
                                background: AnyShapeStyle(Color.accentColor),
                                border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                glassStyle: .none
                            ),
                            valuePosition: .overlayCenter,
                            valueStyle: .capsule,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical top") {
                        SolidProgress(
                            value: 0.5,
                            orientation: .vertical,
                            valuePosition: .top,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical bottom") {
                        SolidProgress(
                            value: 0.5,
                            orientation: .vertical,
                            valuePosition: .bottom,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Circular progress view") {
                    NavigationLink("Circular small red") {
                        SolidProgress(
                            value: 0.0,
                            progressStyle: .init(
                                type: .circular,
                                tint: .red,
                                padding: .init(top: 6, leading: 8, bottom: 6, trailing: 8)
                            ),
                            customCircularScale: 0.5
                        )
                        .padding()
                        Spacer()
                    }
                    NavigationLink("Circular green card") {
                        SolidProgress(
                            value: 0.0,
                            progressStyle: .init(
                                type: .circular,
                                tint: .green,
                                padding: .init(top: 6, leading: 8, bottom: 6, trailing: 8)
                            ),
                            container: .init(
                                background: AnyShapeStyle(.secondary),
                                cornerRadius: 20,
                                borderColor: .primary,
                                borderWidth: 1
                            ),
                            customCircularScale: 1.0
                        )
                        .padding()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Progress Previews")
            .listStyle(.insetGrouped)
        }
    }
}
