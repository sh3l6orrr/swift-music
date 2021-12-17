//
//  Instrument.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Conform to this protocol to play music.
public protocol Instrument {
    /// Play something playable.
    func play(_ content: Playable)
}
