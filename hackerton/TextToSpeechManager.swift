//
//  TextToSpeechManager.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation
import AVFoundation

// TextToSpeechManager.shared.speak(string: `String`)

final class TextToSpeechManager {

    static let shared = TextToSpeechManager()
    private init() { }

    let synthesizer = AVSpeechSynthesizer()

    func speak(string: String) {
        synthesizer.stopSpeaking(at: .word)
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }

    func stop() {
        synthesizer.stopSpeaking(at: .word)
    }
}
