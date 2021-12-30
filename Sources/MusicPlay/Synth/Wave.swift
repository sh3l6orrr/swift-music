//
//  Wave.swift
//  music-play-kit
//
//  Created by Jin Zhang on 12/17/21.
//

import Foundation

/// A physical wave that has an amplitude in a specified position and time.
public struct Wave {
    let function: (Float, Float) -> Float
}

extension Wave {
    /// Create a wave using a wave function y = f(x, t).
    public init(_ function : @escaping (Float, Float) -> Float) {
        self.function = function
    }
    /// A custiom sine wave.
    public static let sine = Wave({ (phase, _) in sin(phase) })
    /// A custom sawtooth wave going upwards.
    public static let sawtoothUp = Wave({ (phase, _) in 1.0 - 2.0 * (phase * (1.0 / twoPi)) })
    /// A custom sawtooth wave going downwards.
    public static let sawtoothDown = Wave({ (phase, _) in 2.0 * (phase * (1.0 / twoPi)) - 1.0 })
    /// A custom square wave.
    public static let square = Wave({ (phase, _) in phase <= Float.pi ? 1.0 : -1.0 })
    /// A custom triangle wave.
    public static let triangle = Wave({ (phase, _) in
        var value = phase * (2.0 / twoPi) - 1.0
        if value < 0.0 { value = -value }
        return 2.0 * (value - 0.5)
    })
    /// A custom white noise.
    public static let whiteNoise = Wave ({ (phase, _) in (Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX)) * 2 - 1 })
}
