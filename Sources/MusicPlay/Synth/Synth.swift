////
////  Synth.swift
////  music-play-kit
////
////  Created by Jin Zhang on 12/17/21.
////
////
//
//import AVFoundation
//import MusicFoundation
//
///// A synthethizer, which produces sounds with oscillators.
//public class Synth : Instrument {
//    /// Assemble a synthethizer with an oscillator.
//    public init(oscillator: Oscillator) {
//        self.frequencyPlayed = 0.0
//        self.oscillator = oscillator
//    }
//    private let oscillator: Oscillator
//    private var engine: AVAudioEngine?
//    private var frequencyPlayed: Float
//}
//
//extension Synth {
//    /// Play a single music note with a pitch.
//    func play(_ musicNote: MusicNote) {
//        self.frequencyPlayed = musicNote.frequency
//        self.setUpEngine()
//        print(self.frequencyPlayed)
//        do {
//            try self.engine!.start()
//            CFRunLoopRunInMode(.defaultMode, CFTimeInterval(1), false)
//            self.engine!.stop()
//        } catch { print("Could not start engine: \(error)") }
//    }
//    //------------------- Not Part of API --------------------------//
//    private func setUpEngine() {
//        let amplitude: Float = 0.5
//
//        let engine = AVAudioEngine()
//        let mainMixer = engine.mainMixerNode
//        let output = engine.outputNode
//        let outputFormat = output.inputFormat(forBus: 0)
//        let sampleRate = Float(outputFormat.sampleRate)
//        // Use output format for input but reduce channel count to 1
//        let inputFormat = AVAudioFormat(
//            commonFormat: outputFormat.commonFormat,
//            sampleRate: outputFormat.sampleRate,
//            channels: 1,
//            interleaved: outputFormat.isInterleaved
//        )
//
//        var currentPhase: Float = 0.0
//        // The interval by which we advance the phase each frame.
//        let phaseIncrement = (twoPi / sampleRate) * self.frequencyPlayed
//
//        let renderBlock: AVAudioSourceNodeRenderBlock = { _, _, frameCount, audioBufferList -> OSStatus in
//            let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
//            for frame in 0 ..< Int(frameCount) {
//                // Get signal value for this frame at time.
//                let value = self.oscillator.wave.function(currentPhase, 0) * amplitude
//
//                currentPhase += phaseIncrement
//                if currentPhase >= twoPi { currentPhase -= twoPi }
//                if currentPhase < 0.0 { currentPhase += twoPi }
//                // Set the same value on all channels (due to the inputFormat we have only 1 channel though).
//                for buffer in ablPointer {
//                    let buf: UnsafeMutableBufferPointer<Float> = UnsafeMutableBufferPointer(buffer)
//                    buf[frame] = value
//                }
//            }
//            return noErr
//        }
//        let sourceNode = AVAudioSourceNode(renderBlock: renderBlock)
//
//        engine.attach(sourceNode)
//
//        engine.connect(sourceNode, to: mainMixer, format: inputFormat)
//        engine.connect(mainMixer, to: output, format: outputFormat)
//        mainMixer.outputVolume = 0.5
//
//        self.engine = engine
//    }
//}
