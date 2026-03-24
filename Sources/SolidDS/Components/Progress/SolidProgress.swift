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
    private let progress: SolidProgressValue
    private let valueConfig: SolidProgressValueConfiguration
    
    // MARK: - Configuration (behavior & layout)
    private let orientation: SolidProgressOrientation
    private let size: SolidProgressSize
    
    // MARK: - Styles (visual systems)
    private let progressStyle: SolidProgressStyle
    private let container: SolidProgressContainerStyle
    private let capsule: SolidProgressCapsuleStyle
    
    // MARK: - Layout Customization (overrides / fine-tuning)
    private let customContentSpacing: CGFloat?
    private let customProgressContainerHeight: CGFloat?
    
    // MARK: - Variant-Specific (circular)
    private let customCircularScale: CGFloat?
    private let customCircularContainerSize: CGFloat?
    
    // MARK: - Accessories (optional extras)
    private let topDivider: SolidProgressDivider?
    private let bottomDivider: SolidProgressDivider?
    
    // MARK: - Init
    public init(
        progress: SolidProgressValue,
        valueConfig: SolidProgressValueConfiguration = .init(),
        
        orientation: SolidProgressOrientation = .horizontal,
        size: SolidProgressSize = .medium,
        
        progressStyle: SolidProgressStyle = .init(),
        container: SolidProgressContainerStyle = .init(),
        capsule: SolidProgressCapsuleStyle = .init(),
        
        customContentSpacing: CGFloat? = nil,
        customProgressContainerHeight: CGFloat? = nil,
        
        customCircularScale: CGFloat? = 1,
        customCircularContainerSize: CGFloat? = nil,
        
        topDivider: SolidProgressDivider? = nil,
        bottomDivider: SolidProgressDivider? = nil
    ) {
        self.progress = progress
        self.valueConfig = valueConfig
        
        self.orientation = orientation
        self.size = size
        
        self.progressStyle = progressStyle
        self.container = container
        self.capsule = capsule
        
        self.customContentSpacing = customContentSpacing
        self.customProgressContainerHeight = customProgressContainerHeight
        
        self.customCircularScale = customCircularScale
        self.customCircularContainerSize = customCircularContainerSize
        
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
        .animation(.easeInOut(duration: 0.25), value: progress.value)
    }
    
    var horizontalLayout: some View {
        Group {
            switch valueConfig.position {
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
            switch valueConfig.position {
                
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
            if valueConfig.style == .capsule {
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
                    progress: progress.value,
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
                ProgressView(value: progress.value)
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
        Text(progress.formatted)
            .font(valueConfig.font)
            .foregroundStyle(valueConfig.color)
    }
    
    var valueCapsule: some View {
        Text(progress.formatted)
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
            .foregroundStyle(valueConfig.color)
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
        valueConfig.font ?? defaultFont
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

// MARK: - Previews
struct SolidProgress_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Section("Simple progress view no %") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .integer(percent: false))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 1, percent: false))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 2, percent: false))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 3 places") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 3, percent: false))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Simple progress view with %") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .integer(percent: true))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 1, percent: true))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 2, percent: true))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 3 places") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 3, percent: true))
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Capsule progress view") {
                    NavigationLink("Integer") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .integer(percent: false)),
                            valueConfig: .init(style: .capsule)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 1 place") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 1, percent: false)),
                            valueConfig: .init(style: .capsule)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Decimal 2 places with %") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 2, percent: true)),
                            valueConfig: .init(style: .capsule)
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("UltraThinMaterial") {
                        VStack {
                            SolidProgress(
                                progress: .init(value: 0.77),
                                valueConfig: .init(style: .capsule),
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    border: .init(color: AnyShapeStyle(Color.accentColor), width: 1),
                                    glassStyle: .ultraThin
                                )
                            )
                            SolidProgress(
                                progress: .init(value: 0.77),
                                valueConfig: .init(style: .capsule),
                                capsule: .init(
                                    background: AnyShapeStyle(.ultraThinMaterial),
                                    border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                    glassStyle: .ultraThin,
                                    glassColors: [
                                        Color.red.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ]
                                )
                            )
                        }
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Capsule BG Image") {
                        SolidProgress(
                            progress: .init(value: 0.77),
                            valueConfig: .init(style: .capsule),
                            capsule: .init(
                                background: AnyShapeStyle(.clear),
                                backgroundImage: Image(.progressBgImg),
                                border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                glassStyle: .none
                            )
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Card container progress view") {
                    NavigationLink("Clear") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 1, percent: false)),
                            valueConfig: .init(style: .capsule),
                            container: .init(
                                background: AnyShapeStyle(.clear),
                                cornerRadius: 16,
                                borderColor: .accentColor,
                                borderWidth: 1,
                                glassStyle: .none
                            )
                        )
                        .padding()
                        Spacer()
                    }
                    NavigationLink("RegularMaterial") {
                        SolidProgress(
                            progress: .init(value: 0.77, format: .decimal(places: 2, percent: true)),
                            valueConfig: .init(style: .capsule),
                            container: .init(
                                background: AnyShapeStyle(.regularMaterial),
                                cornerRadius: 16,
                                borderColor: .accentColor,
                                borderWidth: 1,
                                glassStyle: .none
                            ),
                            capsule: .init(
                                background: AnyShapeStyle(.green)
                            )
                        )
                        .padding()
                        Spacer()
                    }
                    NavigationLink("UltraThinMaterial") {
                        VStack {
                            SolidProgress(
                                progress: .init(value: 0.77, format: .decimal(places: 3, percent: true)),
                                valueConfig: .init(style: .capsule),
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
                                )
                            )
                            SolidProgress(
                                progress: .init(value: 0.88, format: .decimal(places: 2, percent: true)),
                                valueConfig: .init(style: .capsule),
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
                                )
                            )
                        }
                        .padding()
                        Spacer()
                    }
                    NavigationLink("BG Image") {
                        VStack {
                            SolidProgress(
                                progress: .init(value: 0.77, format: .decimal(places: 3, percent: true)),
                                valueConfig: .init(style: .capsule),
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
                                )
                            )
                            
                            
                            SolidProgress(
                                progress: .init(value: 0.77),
                                valueConfig: .init(style: .capsule),
                                capsule: .init(
                                    background: AnyShapeStyle(.clear),
                                    backgroundImage: Image(.progressBgImg),
                                    border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                    glassStyle: .none
                                )
                            )
                        }
                        .padding()
                        Spacer()
                    }
                }
                
                Section("Vertical progress view") {
                    NavigationLink("Vertical leading") {
                        SolidProgress(
                            progress: .init(value: 0.5),
                            valueConfig: .init(position: .leading, style: .capsule),
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical trailing") {
                        SolidProgress(
                            progress: .init(value: 0.5),
                            valueConfig: .init(position: .trailing, style: .capsule),
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical overlayCenter") {
                        SolidProgress(
                            progress: .init(value: 0.5),
                            valueConfig: .init(position: .overlayCenter, style: .capsule),
                            orientation: .vertical,
                            capsule: .init(
                                background: AnyShapeStyle(Color.accentColor),
                                border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                glassStyle: .none
                            ),
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical top") {
                        SolidProgress(
                            progress: .init(value: 0.5),
                            valueConfig: .init(position: .top, style: .capsule),
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                    NavigationLink("Vertical bottom") {
                        SolidProgress(
                            progress: .init(value: 0.5),
                            valueConfig: .init(position: .bottom, style: .capsule),
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        .padding(.vertical)
                        Spacer()
                    }
                }
                
                Section("Circular progress view") {
                    NavigationLink("Circular small red") {
                        SolidProgress(
                            progress: .init(value: 0.0),
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
                            progress: .init(value: 0.0),
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
