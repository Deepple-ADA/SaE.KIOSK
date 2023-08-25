//
//  WordTaggerViewModel.swift
//  NC2
//
//  Created by HAN GIBAEK on 2023/08/23.
//

import Foundation
import CoreML

class WordTaggerViewModel: ObservableObject {
    var config: MLModelConfiguration
    var model: WordTagger1?
    var labels: [String] = [""]
    var tokens: [String] = [""]
    
    init() {
        self.config = MLModelConfiguration()
        do {
            self.model = try WordTagger1(configuration: config)
        }
        catch {
            self.model = nil
            print(error.localizedDescription)
        }
    }
    
    func tag(text: String) {
        do {
            if let prediction = try model?.prediction(text: text) {
                self.tokens = prediction.tokens
                self.labels = prediction.labels
            }
        }
        catch {
            self.tokens = ["ERROR"]
            self.tokens = ["ERROR"]
            print(error.localizedDescription)
        }
    }
    
    func getMenus() -> [[String]] {
        var temp: [[String]] = []
        var menuFlag = false
        var countFlag = false
        var menu = ""
        var count = ""
        for i in 0..<(tokens.count){
            if labels[i] == "None" {
                if menu != "" {
                    temp.append([menu, count != "" ? count : "1개"])
                }
                menu = ""
                count = ""
                menuFlag = false
                countFlag = false
            } else if labels[i] == "MENU" {
                if menuFlag {
                    countFlag = false
                    menu += " " + tokens[i]
                } else {
                    if menu != "" {
                        temp.append([menu, count != "" ? count : "1개"])
                    }
                    
                    menu = tokens[i]
                    menuFlag = true
                    countFlag = false
                }
                count = ""
            } else {
                if countFlag {
                    menuFlag = false
                    count += tokens[i]
                } else {
                    count = tokens[i]
                    menuFlag = false
                    countFlag = true
                }
            }
            print("현재 label: \(labels[i])")
            print("현재 token: \(tokens[i])")
            print("menu: \(menu)")
            print("menuFlag: \(menuFlag)")
            print("count: \(count)")
            print("countFlag: \(countFlag)")
            print("")
        }
        if menu != "" {
            temp.append([menu, count != "" ? count : "1개"])
        }
        return temp
    }
}
