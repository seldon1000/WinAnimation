//
//  WinAnimationApp.swift
//  WinAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

@main
struct SwiftUI_AnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            Start()
                .preferredColorScheme(.light)
                .statusBar(hidden: true)
        }
    }
}
