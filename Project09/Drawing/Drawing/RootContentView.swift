//
//  RootContentView.swift
//  Drawing
//
//  Created by Nicholas Wright on 11/29/19.
//  Copyright © 2019 Nick Wright Development. All rights reserved.
//

import SwiftUI

struct RootContentView: View {
    
    var myViews: [Any] = [DrawingPathsView(), ShapesExampleView()]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Day 43")) {
                    NavigationLink(destination: DrawingPathsView()) {
                        Text("Drawing Paths")
                    }
                    NavigationLink(destination: ShapesExampleView()) {
                        Text("Shapes Example")
                    }
                }
                Section(header: Text("Day 44")) {
                    NavigationLink(destination: DrawFlowerView()) {
                        Text("Draw Flower View")
                    }
                    NavigationLink(destination: BordersAndFillsView()) {
                        Text("Borders And Fills")
                    }
                    NavigationLink(destination: MetalWithDrawingGroupView()) {
                        Text("Metal with Drawing Group View")
                    }
                }
                Section(header: Text("Day 45")) {
                    NavigationLink(destination: BlendingMultiplyView()) {
                        Text("Blending with Multiply")
                    }
                    NavigationLink(destination: BlendingScreenView()) {
                        Text("Blending with Screen")
                    }
                    NavigationLink(destination: BlurAndSaturationView()) {
                        Text("Blur And Saturation")
                    }
                    NavigationLink(destination: AnimatableDataView()) {
                        Text("Using AnimatableData")
                    }
                    NavigationLink(destination: AnimatablePairView()) {
                        Text("Using AnimatablePair")
                    }
                    NavigationLink(destination: CreateSpirographView()) {
                        Text("Create Spirograph")
                    }
                }
                Section(header: Text("Day 46")) {
                    NavigationLink(destination: ArrowChallengeView()) {
                        Text("Draw an Arrow")
                    }
                }
            }
            .navigationBarTitle("Drawing App Examples")
        }
        
    }
}

struct RootContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}
