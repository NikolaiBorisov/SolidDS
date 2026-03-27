//
//  SolidProgressAllTypesDemoView.swift
//  SolidDSCatalog
//
//  Created by NIKOLAI BORISOV on 17.03.2026.
//

import SwiftUI
import SolidDS

struct SolidProgressAllTypesDemoView: View {
    
    @State private var progress: Double = 0.05
    
    var body: some View {
        NavigationView {
            List {
                Section("Simple progress view no %") {
                    NavigationLink("Integer & Decimal previews") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(progress: .init(value: 0.77, format: .integer(percent: false)))
                                SolidProgress(progress: .init(value: 0.77, format: .decimal(places: 3, percent: false)))
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Simple progress view with %") {
                    NavigationLink("Integer & Decimal previews") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(progress: .init(value: 0.77, format: .integer(percent: true)))
                                SolidProgress(progress: .init(value: 0.77, format: .decimal(places: 3, percent: true)))
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Capsule progress views") {
                    NavigationLink("Integer & Decimal previews") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    progress: .init(value: 0.77, format: .integer(percent: false)),
                                    valueConfig: .init(style: .capsule)
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
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Card container progress views") {
                    NavigationLink("Card containers") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    progress: .init(value: 0.77, format: .decimal(places: 2, percent: true)),
                                    valueConfig: .init(style: .capsule),
                                    container: .init(
                                        background: AnyShapeStyle(.regularMaterial),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    )
                                )
                                SolidProgress(
                                    progress: .init(value: 0.77, format: .decimal(places: 2, percent: true)),
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
                                    )
                                )
                                SolidProgress(
                                    progress: .init(value: 0.77, format: .decimal(places: 3, percent: true)),
                                    valueConfig: .init(style: .capsule),
                                    container: .init(
                                        background: AnyShapeStyle(.regularMaterial),
                                        backgroundImage: Image(.progressBgImg),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    )
                                )
                                SolidProgress(
                                    progress: .init(value: 0.77),
                                    valueConfig: .init(style: .capsule),
                                    container: .init(
                                        background: AnyShapeStyle(.clear),
                                        backgroundImage: Image(.progressBgImg),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    )
                                )
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                
                Section("Vertical progress views") {
                    NavigationLink("Vertical") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .leading, style: .capsule),
                                    orientation: .vertical,
                                    customSettings: .init(progressContainerHeight: 100)
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .trailing, style: .capsule),
                                    orientation: .vertical,
                                    customSettings: .init(progressContainerHeight: 100)
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .overlayCenter, style: .capsule),
                                    orientation: .vertical,
                                    capsule: .init(
                                        background: AnyShapeStyle(.clear),
                                        backgroundImage: Image(.progressBgImg),
                                        border: .init(color: AnyShapeStyle(Color.blue), width: 1),
                                        glassStyle: .none
                                    ),
                                    customSettings: .init(progressContainerHeight: 100)
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .top, style: .capsule),
                                    orientation: .vertical,
                                    customSettings: .init(progressContainerHeight: 100)
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .bottom, style: .capsule),
                                    orientation: .vertical,
                                    customSettings: .init(progressContainerHeight: 100)
                                )
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Circular progress views") {
                    NavigationLink("Circular") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    progress: .init(value: 0.0),
                                    progressStyle: .init(
                                        type: .circular,
                                        tint: .red,
                                        padding: .init(top: 6, leading: 8, bottom: 6, trailing: 8)
                                    ),
                                    customSettings: .init(circularScale: 0.5)
                                )
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
                                    customSettings: .init(circularScale: 0.9)
                                )
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                Section("Full setup") {
                    NavigationLink("SolidProgress") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    progress: .init(
                                        value: 0.88,
                                        format: .decimal(places: 2, percent: true)
                                    ),
                                    valueConfig: .init(
                                        position: .trailing,
                                        style: .capsule,
                                        color: .primary,
                                        font: .caption.monospacedDigit()
                                    ),
                                    orientation: .horizontal,
                                    size: .medium,
                                    progressStyle: .init(
                                        type: .linear,
                                        tint: .green,
                                        trackColor: Color.gray,
                                        trackHeight: 4,
                                        trackShadow: .init(
                                            color: .black.opacity(0.25),
                                            radius: 4,
                                            x: 0,
                                            y: 2
                                        ),
                                        padding: EdgeInsets(
                                            top: 6,
                                            leading: 8,
                                            bottom: 6,
                                            trailing: 8
                                        )
                                    ),
                                    container: .init(
                                        background: AnyShapeStyle(.regularMaterial),
                                        backgroundImage: Image(.progressBgImg),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .ultraThin,
                                        glassColors: [
                                            Color.red.opacity(0.3),
                                            Color.orange.opacity(0.1)
                                        ],
                                        shadow: .init(
                                            color: .black.opacity(0.25),
                                            radius: 4,
                                            x: 0,
                                            y: 2
                                        )
                                    ),
                                    capsule: .init(
                                        background: AnyShapeStyle(.ultraThinMaterial),
                                        backgroundImage: Image(.progressBgImg),
                                        border: .init(
                                            color: AnyShapeStyle(Color.accentColor.opacity(0.3)),
                                            width: 1
                                        ),
                                        glassStyle: .ultraThin,
                                        glassColors: [
                                            Color.red.opacity(0.3),
                                            Color.orange.opacity(0.1)
                                        ],
                                        padding: EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6),
                                        shadow: .init(
                                            color: .black.opacity(0.25),
                                            radius: 4,
                                            x: 0,
                                            y: 2
                                        )
                                    ),
                                    customSettings: .init(
                                        contentSpacing: 10,
                                        progressContainerHeight: 25,
                                        circularScale: 0,
                                        circularContainerSize: nil
                                    ),
                                    topDivider: .init(
                                        color: .primary,
                                        height: 2,
                                        padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                    ),
                                    bottomDivider: .init(
                                        color: .primary,
                                        height: 2,
                                        padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                    )
                                )
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                Section("Animation ++") {
                    NavigationLink("Progress views") {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("🌱 Springy")
                                ProgressDemoAnimationView(
                                    animation: .spring(response: 0.4, dampingFraction: 0.7),
                                    places: 1,
                                    percent: false
                                )
                                .padding(.vertical)
                                Text("⚡ Snappy")
                                ProgressDemoAnimationView(
                                    animation: .snappy(duration: 0.4),
                                    places: 2,
                                    percent: false
                                )
                                .padding(.vertical)
                                Text("🐌 Smooth")
                                ProgressDemoAnimationView(
                                    animation: .smooth(duration: 0.5),
                                    places: 3,
                                    percent: false
                                )
                                .padding(.vertical)
                                Text("🏀 Bouncy XL")
                                ProgressDemoAnimationView(
                                    animation: .spring(response: 0.5, dampingFraction: 0.4),
                                    places: 0,
                                    percent: true
                                )
                                .padding(.vertical)
                                Text("✨ Spring Blend")
                                ProgressDemoAnimationView(
                                    animation: .spring(response: 0.35, dampingFraction: 0.8, blendDuration: 0.3),
                                    places: 0,
                                    percent: true
                                )
                                .padding(.vertical)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                Section("Animation ++") {
                    NavigationLink("Progress views") {
                        ProgressPreviewsView()
                    }
                }
            }
            .navigationTitle("Progress Previews")
            .listStyle(.insetGrouped)
        }
    }
}

struct ProgressDemoAnimationView: View {
    
    @State var animation: Animation?
    @State var places: Int
    @State var percent: Bool
    
    @State private var progress: Double = 0.7
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            SolidProgress(
                progress: .init(
                    value: progress,
                    format: .decimal(places: places, percent: percent)
                ),
                valueConfig: .init(style: .capsule),
                capsule: .init(
                    background: AnyShapeStyle(.ultraThinMaterial),
                    glassStyle: .ultraThin,
                    glassColors: [
                        Color.blue.opacity(0.2),
                        Color.purple.opacity(0.1)
                    ]
                ),
                animation: animation
            )
            .padding(.vertical)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.blue.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                    progress = Double.random(in: 0...1)
                    isPressed.toggle()
                }
            }) {
                Text("🔄")
                    .font(.title)
                // .rotationEffect(.degrees(isPressed ? 180 : 0))
                    .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isPressed)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .stroke(Color.blue.opacity(0.7), lineWidth: 1)
                            .shadow(color: Color.blue.opacity(0.3), radius: 4, x: 0, y: 2)
                    )
                // .scaleEffect(isPressed ? 1.2 : 1)
            }
        }
    }
}

struct ProgressPreviewsView: View {
    
    @State private var activeIndex: Int = 0 // first one active by default
    
    var body: some View {
        NavigationView {
            List {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        ProgressRow(
                            index: 0,
                            activeIndex: $activeIndex,
                            title: "🌱 Springy",
                            animation: .spring(response: 0.4, dampingFraction: 0.7),
                            places: 1,
                            percent: false
                        )
                        
                        ProgressRow(
                            index: 1,
                            activeIndex: $activeIndex,
                            title: "⚡ Snappy",
                            animation: .snappy(duration: 0.4),
                            places: 2,
                            percent: false
                        )
                        
                        ProgressRow(
                            index: 2,
                            activeIndex: $activeIndex,
                            title: "🐌 Smooth",
                            animation: .smooth(duration: 0.5),
                            places: 3,
                            percent: false
                        )
                        
                        ProgressRow(
                            index: 3,
                            activeIndex: $activeIndex,
                            title: "🏀 Bouncy XL",
                            animation: .spring(response: 0.5, dampingFraction: 0.4),
                            places: 0,
                            percent: true
                        )
                        
                        ProgressRow(
                            index: 4,
                            activeIndex: $activeIndex,
                            title: "✨ Spring Blend",
                            animation: .spring(response: 0.35, dampingFraction: 0.8, blendDuration: 0.3),
                            places: 0,
                            percent: true
                        )
                        
                        // NEW Animations
                        ProgressRow(
                            index: 5,
                            activeIndex: $activeIndex,
                            title: "🌊 Wobbly",
                            animation: .spring(response: 0.45, dampingFraction: 0.3),
                            places: 2,
                            percent: false
                        )
                        
                        ProgressRow(
                            index: 6,
                            activeIndex: $activeIndex,
                            title: "💧 Smooth Ease",
                            animation: .easeInOut(duration: 0.6),
                            places: 2,
                            percent: true
                        )
                        
                        ProgressRow(
                            index: 7,
                            activeIndex: $activeIndex,
                            title: "🎯 Elastic",
                            animation: .interpolatingSpring(stiffness: 200, damping: 5),
                            places: 0,
                            percent: false
                        )
                    }
                    .padding(.vertical)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct ProgressRow: View {
    
    let index: Int
    @Binding var activeIndex: Int
    
    let title: String
    var animation: Animation?
    var places: Int
    var percent: Bool
    
    @State private var progress: Double = 0.7
    @State private var isPressed = false
    @State private var tapCount: Int = 0 // track taps
    
    var isActive: Bool { activeIndex == index }
    
    var body: some View {
        VStack(spacing: 8) {
            
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isActive ? .primary : .secondary)
                Spacer()
            }
            
            SolidProgress(
                progress: .init(
                    value: progress,
                    format: .decimal(places: places, percent: percent)
                ),
                valueConfig: .init(style: .capsule),
                capsule: .init(
                    background: AnyShapeStyle(.ultraThinMaterial),
                    glassStyle: .ultraThin,
                    glassColors: [
                        Color.blue.opacity(0.2),
                        Color.purple.opacity(0.1)
                    ]
                ),
                animation: animation
            )
            .opacity(isActive ? 1 : 0.4) // dim inactive
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(
                        colors: [Color.blue.opacity(0.1), Color.blue.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            
            // Show button only for active row AND tapCount < 5
            if isActive && tapCount < 5 {
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        progress = Double.random(in: 0...1)
                        isPressed.toggle()
                        tapCount += 1
                        
                        // Automatically activate next row after 5 taps
                        if tapCount >= 2 {
                            activeIndex += 1
                        }
                    }
                }) {
                    Text("🔄")
                        .font(.title)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .stroke(Color.blue.opacity(0.7), lineWidth: 1)
                                .shadow(color: Color.blue.opacity(0.3), radius: 4, x: 0, y: 2)
                        )
                        .scaleEffect(isPressed ? 1.1 : 1)
                        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isPressed)
                }
                .padding(.vertical)
            }
        }
    }
}
