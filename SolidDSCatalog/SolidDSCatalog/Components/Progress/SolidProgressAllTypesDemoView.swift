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
                                    customProgressContainerHeight: 100
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .trailing, style: .capsule),
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
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
                                    customProgressContainerHeight: 100,
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .top, style: .capsule),
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
                                )
                                SolidProgress(
                                    progress: .init(value: 0.5),
                                    valueConfig: .init(position: .bottom, style: .capsule),
                                    orientation: .vertical,
                                    customProgressContainerHeight: 100
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
                                    customCircularScale: 0.5
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
                                    customCircularScale: 1.0
                                )
                            }
                            .padding()
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
