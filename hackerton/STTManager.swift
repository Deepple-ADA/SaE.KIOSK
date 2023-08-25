//
//  OrderButtonView.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/17.
//

import AVFoundation
import SwiftUI
import Speech

class SpeechManager: ObservableObject {
    @Published var outputText = ""
    @Published var isRecording = false
    
    private var audioEngine = AVAudioEngine()
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    init() {
        speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
    }
    
    func startRecording() {
        isRecording = true
        outputText = ""
        
        let node = audioEngine.inputNode
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("recognitionRequest - error") }
        recognitionRequest.shouldReportPartialResults = true //true -> 실시간으로 변환
        // recognitionRequest.shouldReportPartialResults = false //false -> 종료 후 한꺼번에 변환
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { [weak self] result, error in
            if let result = result {
                self?.outputText = self?.convert(result.bestTranscription.formattedString) ?? ""
            } else if let error = error {
                print(error)
            }
        }
        
        let recordingFormat = node.outputFormat(forBus: 0)
        //마이크 통해 들어온 음성 append
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }
        
        audioEngine.prepare()
        
        
        do {
            try audioEngine.start()
        } catch {
            // print("audioEngine - Error : \(error)")
        }
        
        
    }
    
    func stopRecording() {
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        isRecording = false
        recognitionTask?.cancel()
    }
    
    func convert(_ inputText: String) -> String {
        var convertedText = inputText
        //단어 바꾸고 싶으면 여기 추가해서 바꿔주세요
        let wordPair = [("세계", "3개")]
        for (word1, word2) in wordPair {
            convertedText = convertedText.replacingOccurrences(of: word1, with: word2)
        }
        return convertedText
    }
    
    
}


protocol STTModelProtocol {
    var outputText: String { get set }
}


struct STTManager: View {
    @StateObject private var speechManager = SpeechManager()
    //@State private var result: [String] = []

    @State var view: STTModelProtocol
    
    var body: some View {
        VStack {
            //여기 speechManager.outputText를 베니AI가 만든 ML에 넣어야 됨
            
            Text(speechManager.outputText)
                .foregroundColor(.black)
                .padding()
            
            Button(action: {
                if speechManager.isRecording {
                    //result.append(speechManager.outputText)
                    view.outputText = speechManager.outputText
                    speechManager.stopRecording()
                    
                    
                } else {
                    speechManager.startRecording()
                }
            }) {
                Text(speechManager.isRecording ? "녹음 중단" : "녹음 시작")
            }
        }
        
        RoundedRectangle(cornerRadius: 32)
        //.frame(width: 464, height: 604)
    }
}
