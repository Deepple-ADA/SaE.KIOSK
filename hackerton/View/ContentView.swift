//
//  ContentView.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/17.
//

import SwiftUI

struct ContentView: View {
    @State private var isLinkActive = false
    @State private var isRecommend = false
    
    var body: some View {
        ZStack {
            ARKitView(isTracking: $isLinkActive)
            NavigationStack {
                VStack(spacing: 32) {
                    advertisementView
                    HStack{
                        bottomLeftView
                        orderBtn
                    }
                }
                .navigationDestination(isPresented: $isLinkActive) {
                    MenuView(isLinkActive: $isLinkActive, isRecommend: $isRecommend)
                }
            }
        }//ZStack
        .statusBar(hidden: true)
    }
    
    private var advertisementView: some View {
        RoundedRectangle(cornerRadius: 32)
            .frame(width: 960, height: 635)
            .foregroundColor(.secondary)
            .overlay(
                Image("adExample")
            )
    }
    
    private var bottomLeftView: some View {
        HStack(spacing: 30){
            VStack(spacing: 53) {
                LottieView(filename: "logo")
                    .frame(width:200, height: 200)
                VStack{
                    Text("음성으로 주문하려면")
                        .foregroundColor(.Textprimary)
                    Text("화면을 바라보고")
                        .foregroundColor(.PointPrimary)
                    HStack(spacing: 0){
                        Text("말씀")
                            .foregroundColor(.PointPrimary)
                        Text("해주세요")
                            .foregroundColor(.Textprimary)
                    }
                }
            }
            .font(.system(size: 36))
            .frame(width: 464, height: 604)
        }
    }
    
    private var orderBtn: some View {
        Button {
            isLinkActive = true
        } label: {
            Image("orderBtn")
                .frame(width: 464, height: 604)
        }
       
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
