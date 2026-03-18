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
                
                // Progress Value Placement
                VStack(spacing: 16) {
                    
                    description(text: "Progress Value Placement")
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .leading
                    )
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .top
                    )
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .bottom
                    )
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .overlayCenter,
                        valueStyle: .capsule,
                        capsuleBgColor: .accentColor,
                        capsuleBorderColor: .primary
                    )
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .overlayLeading,
                        valueStyle: .capsule,
                        capsuleBgColor: .accentColor,
                        capsuleBorderColor: .primary
                    )
                    
                    SolidProgress(
                        value: 0.7,
                        valuePosition: .overlayTrailing,
                        valueStyle: .capsule,
                        capsuleBgColor: .accentColor,
                        capsuleBorderColor: .primary
                    )
                }
                
                Divider().padding(.vertical)
                
                // Vertical progress view
                VStack(spacing: 16) {
                    
                    description(text: "Vertical progress view")
                    
                    HStack {
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .leading,
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .trailing,
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                    }
                    
                    HStack {
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .top,
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        Spacer()
                    }
                    
                    HStack {
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .bottom,
                            orientation: .vertical,
                            customProgressContainerHeight: 100
                        )
                        Spacer()
                    }
                    
                    HStack {
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .overlayCenter,
                            orientation: .vertical,
                            valueStyle: .capsule,
                            customProgressContainerHeight: 100,
                            capsuleBgColor: .accentColor,
                            capsuleBorderColor: .primary
                        )
                        Spacer()
                    }
                    
                    HStack {
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .overlayLeading,
                            orientation: .vertical,
                            valueStyle: .capsule,
                            customProgressContainerHeight: 100,
                            capsuleBgColor: .accentColor,
                            capsuleBorderColor: .primary
                        )
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        SolidProgress(
                            value: 0.5,
                            valuePosition: .overlayTrailing,
                            orientation: .vertical,
                            valueStyle: .capsule,
                            customProgressContainerHeight: 100,
                            capsuleBgColor: .accentColor,
                            capsuleBorderColor: .primary,
                        )
                    }
                }
                
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
    
    // MARK: - Helpers
    private func description(text: String) -> some View {
        Text(text)
            .textCase(.uppercase)
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.secondary)
            .padding(.leading, 8)
    }
}
