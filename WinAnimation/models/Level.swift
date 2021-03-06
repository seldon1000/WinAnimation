//
//  Level.swift
//  WinAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

struct Level {
    let rows: Int
    let cols: Int
    let startDot: (Int, Int)
    let obstacles: [(Int, Int)]
}

let level = Level(rows: 13, cols: 6, startDot: (2, 1), obstacles: [(0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 0), (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (2, 0), (2, 5), (3, 0), (3, 1), (3, 2), (3, 3), (3, 5), (4, 0), (4, 1), (4, 2), (4, 3), (4, 5), (5, 0), (5, 1), (5, 2), (5, 3), (5, 5), (6, 0), (6, 1), (6, 2), (6, 3), (6, 5), (7, 0), (7, 1), (7, 2), (7, 3), (7, 5), (8, 0), (8, 1), (8, 2), (8, 3), (8, 5), (9, 0), (9, 1), (9, 2), (9, 3), (9, 5), (10, 0), (10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (11, 0), (11, 1), (11, 2), (11, 3), (11, 4), (11, 5), (12, 0), (12, 1), (12, 2), (12, 3), (12, 4), (12, 5)])
