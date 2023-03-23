//
//  TypstApp.swift
//  Typst
//
//  Created by Aleks Rutins on 3/22/23.
//

import SwiftUI
import AppKit

struct VisualEffectView: NSViewRepresentable
{
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView
    {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = .active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context)
    {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

@main
struct TypstApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().background(VisualEffectView(material: .sidebar, blendingMode: .behindWindow).ignoresSafeArea())
        }
        .windowStyle(.hiddenTitleBar)
    }
}
