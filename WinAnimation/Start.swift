//
//  Start.swift
//  WinAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct Start: View {
    @State var grid: Grid = Grid(level: level)
    @State var showMenu: Bool = false
    @State var win: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ForEach(0..<grid.rows, id: \.self) { i in
                    HStack(spacing: 0) {
                        ForEach(grid.dots[i]) { dot in
                            DotComponent(win: $win, dot: dot)
                        }
                    }
                }
            }
            .environmentObject(grid)
            .contentShape(Rectangle())
            .scaleEffect(showMenu ? 0.6 : 1.0)
            .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.6 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.6 : 1.0))
            .onTapGesture {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
            .onLongPressGesture {
                if !win {
                    withAnimation(.easeInOut) {
                        showMenu = true
                    }
                }
            }
            .gesture(DragGesture().onEnded { value in
                if !win && !showMenu {
                    if grid.dragGesture(translation: value.translation) {
                        win.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation(.easeInOut) {
                                showMenu = false
                                
                                grid.resetGrid()
                            }
                        }
                    }
                }
            })
        }
        .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.6 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.6 : 1.0))
    }
}
