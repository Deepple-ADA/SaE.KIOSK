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
    @Published var isRecommendSentence = false
    
    
    private var audioEngine = AVAudioEngine()
    private var speechRecognizer: SFSpeechRecognizer?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    init() {
        speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch { }
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
    
    //    func checkRecommend(input: String) {
    //        isRecommendSentence = input.contains("추천")
    //    }
}


protocol STTModelProtocol {
    var outputText: String { get set }
    var cart: [MenuVO] { get set }
}

struct STTManager: View {
    @StateObject private var speechManager = SpeechManager()
    @StateObject var wordTaggerViewModel = WordTaggerViewModel()
    @EnvironmentObject var chatGPTManager: ChatGPTManager
    @State private var checkRunning = false
    @Binding var isRecommend: Bool
    @State var view: STTModelProtocol
    //    @StateObject var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack {
            sttButton
            
        }
    }
    
    private var sttButton: some View {
        Button {
            if speechManager.isRecording { //종료
                view.outputText = speechManager.outputText
                speechManager.stopRecording()
                
                
                if speechManager.outputText.contains("추천") {
                    //추천
                    isRecommend = true
                    // GPT ㅎㅇ
                    
                    chatGPTManager.sendMessage(input: speechManager.outputText)
                    
                } else { //주문
                    wordTaggerViewModel.tag(text: speechManager.outputText)
                    let menus = wordTaggerViewModel.getMenus()
                    
                    // [[String]] -> [Order]
                    let orders = MenuCreator.convert(predictions: menus)
                    
                    // [Order] -> [MenuVO]
                    let menusVO = orders.map { order in
                        MenuVO(productName: order.menu.name, price: order.menu.price, amount: order.count)
                    }
                    
                    // tts speaking - 더 필요?
                    let ttsSentence = TTSSentences.needMore(check: menusVO)
                    TextToSpeechManager.shared.speak(string: ttsSentence)
                    addToCart(items: menusVO)
                }
                
            } else { //시작
                TextToSpeechManager.shared.stop()
                speechManager.startRecording()
                
            }
        } label: {
            HStack{
                if speechManager.isRecording {
                    LottieView(filename: "soundIcon")
                        .frame(width: 150, height: 150)
                } else {
                    LottieView(filename: "logo")
                        .frame(width: 150, height: 150)
                }
                Spacer()
                VStack(spacing: 13) {
                    Text("\(speechManager.outputText)")
                        .font(.system(size: 24))
                    Text(speechManager.isRecording ? "\(speechManager.outputText)" : "아래와 같이 말씀해보세요")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text(speechManager.isRecording ? "" : """
                     소시지 한개 주세요
                     바삭한 과자 추천해줘
                    """)
                    .font(.system(size: 20))
                    .foregroundColor(.TextSecondary)
                }
                Spacer()
            }
        }
    }
    
    private func addToCart(items newMenus: [MenuVO]) {
        let itemNamesInCart = view.cart.map { $0.productName }
        var menuNotInCart = [MenuVO](),
            menuAlreadyInCart = [MenuVO]()
        for newMenu in newMenus {
            if itemNamesInCart.contains(newMenu.productName) {
                menuAlreadyInCart.append(newMenu)
            } else {
                menuNotInCart.append(newMenu)
            }
        }
        // 중복인 품목 더하기
        for menu in menuAlreadyInCart {
            for i in view.cart.indices {
                if view.cart[i] == menu {
                    view.cart[i].amount += menu.amount
                    break
                }
            }
        }
        // 새 품목 추가하기
        view.cart += menuNotInCart
    }
}
