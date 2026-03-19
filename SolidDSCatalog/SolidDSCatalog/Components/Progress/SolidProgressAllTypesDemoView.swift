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
                                SolidProgress(value: 0.77, valueFormat: .integer(percent: false))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 1, percent: false))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 2, percent: false))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 3, percent: false))
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
                                SolidProgress(value: 0.77, valueFormat: .integer(percent: true))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 1, percent: true))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 2, percent: true))
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 3, percent: true))
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Capsule progress view") {
                    NavigationLink("Integer & Decimal previews") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(value: 0.77, valueFormat: .integer(percent: false), valueStyle: .capsule)
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 1, percent: false), valueStyle: .capsule)
                                SolidProgress(value: 0.77, valueFormat: .decimal(places: 2, percent: true), valueStyle: .capsule)
                                SolidProgress(
                                    value: 0.77,
                                    valueStyle: .capsule,
                                    capsuleBgColor: AnyShapeStyle(.ultraThinMaterial),
                                    capsuleBorderColor: .blue,
                                    capsuleGlassStyle: .ultraThin
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueStyle: .capsule,
                                    capsuleBgColor: AnyShapeStyle(.ultraThinMaterial),
                                    capsuleBorderColor: .blue,
                                    capsuleGlassStyle: .ultraThin,
                                    capsuleGlassColors: [
                                        Color.red.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ]
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueColor: .black,
                                    valueStyle: .capsule,
                                    capsuleBgColor: AnyShapeStyle(.clear),
                                    capsuleBorderColor: .blue,
                                    capsuleGlassStyle: .none,
                                    capsuleBackgroundImage: Image(.progressBgImg)
                                )
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Card container progress view") {
                    NavigationLink("Card containers") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    value: 0.77,
                                    valueFormat: .decimal(places: 1, percent: false),
                                    valueStyle: .capsule,
                                    container: .init(
                                        background: AnyShapeStyle(.clear),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    ),
                                    topDivider: nil,
                                    bottomDivider: nil
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueFormat: .decimal(places: 2, percent: true),
                                    valueStyle: .capsule,
                                    container: .init(
                                        background: AnyShapeStyle(.regularMaterial),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    ),
                                    capsuleBgColor: AnyShapeStyle(.green),
                                    topDivider: nil,
                                    bottomDivider: nil
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueFormat: .decimal(places: 3, percent: true),
                                    valueStyle: .capsule,
                                    container: .init(
                                        background: AnyShapeStyle(.ultraThinMaterial),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .ultraThin
                                    ),
                                    capsuleBgColor: AnyShapeStyle(.ultraThinMaterial),
                                    capsuleGlassStyle: .ultraThin,
                                    topDivider: nil,
                                    bottomDivider: nil
                                )
                                SolidProgress(
                                    value: 0.88,
                                    valueFormat: .decimal(places: 2, percent: true),
                                    valueStyle: .capsule,
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
                                    capsuleBgColor: AnyShapeStyle(.ultraThinMaterial),
                                    capsuleGlassStyle: .ultraThin,
                                    topDivider: nil,
                                    bottomDivider: nil
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueFormat: .decimal(places: 3, percent: true),
                                    valueStyle: .capsule,
                                    progressTint: .red,
                                    container: .init(
                                        background: AnyShapeStyle(.regularMaterial),
                                        backgroundImage: Image(.progressBgImg),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    ),
                                    progressTrackColor: .gray,
                                    capsuleBgColor: AnyShapeStyle(.regularMaterial),
                                    capsuleGlassStyle: .none,
                                    topDivider: nil,
                                    bottomDivider: nil
                                )
                                SolidProgress(
                                    value: 0.77,
                                    valueColor: .black,
                                    valueStyle: .capsule,
                                    progressTint: .green,
                                    container: .init(
                                        background: AnyShapeStyle(.clear),
                                        backgroundImage: Image(.progressBgImg),
                                        cornerRadius: 16,
                                        borderColor: .accentColor,
                                        borderWidth: 1,
                                        glassStyle: .none
                                    ),
                                    progressTrackColor: .gray,
                                    capsuleBgColor: AnyShapeStyle(.clear),
                                    capsuleBorderColor: .black,
                                    capsuleGlassStyle: .none,
                                    capsuleBackgroundImage: Image(.progressBgImg)
                                )
                            }
                            .padding()
                            Spacer()
                        }
                    }
                }
                
                Section("Vertical progress view") {
                    NavigationLink("Vertical leading") {
                        ScrollView {
                            VStack(spacing: 12) {
                                SolidProgress(
                                    value: 0.5,
                                    valuePosition: .leading,
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
                                )
                                SolidProgress(
                                    value: 0.5,
                                    valuePosition: .trailing,
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
                                )
                                SolidProgress(
                                    value: 0.5,
                                    valuePosition: .overlayCenter,
                                    orientation: .vertical,
                                    valueStyle: .capsule,
                                    customProgressContainerHeight: 100,
                                    capsuleBgColor: AnyShapeStyle(Color.accentColor),
                                    capsuleBorderColor: .primary
                                )
                                SolidProgress(
                                    value: 0.5,
                                    valuePosition: .top,
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
                                )
                                SolidProgress(
                                    value: 0.5,
                                    valuePosition: .bottom,
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
                                )
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
                
                Section("Circular progress view") {
                    NavigationLink("Circular small red") {
                        ScrollView {
                            VStack(spacing: 12) {
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
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Progress Previews")
            .listStyle(.insetGrouped)
        }
    }
}
