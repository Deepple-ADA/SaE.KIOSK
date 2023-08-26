//
//  ARViewContainer.swift
//  hackerton
//
//  Created by Greed on 2023/08/26.
//
import SwiftUI
import ARKit

struct ARKitView: UIViewRepresentable {
    @Binding var isTracking: Bool

    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        let configuration = ARFaceTrackingConfiguration()
        arView.session.run(configuration)
        arView.delegate = context.coordinator
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
            var parent: ARKitView

            init(_ parent: ARKitView) {
                self.parent = parent
            }

            func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
                if let faceAnchor = anchor as? ARFaceAnchor {
                    let cameraTransform = node.transform // 카메라의 변환 행렬

                    // 왼쪽 눈의 변환 행렬을 가져옴
                    let leftEyeTransform = faceAnchor.leftEyeTransform
                    if leftEyeTransform != matrix_identity_float4x4 {
                        // 눈의 위치를 기기의 좌표계로 변환
                        let leftEyePosition = SIMD3<Float>(leftEyeTransform.columns.3.x,
                                                           leftEyeTransform.columns.3.y,
                                                           leftEyeTransform.columns.3.z)
                        // 카메라 위치를 가져옴
                        let cameraPosition = SIMD3<Float>(cameraTransform.m41,
                                                          cameraTransform.m42,
                                                          cameraTransform.m43)
                        
                        // 눈과 카메라 사이의 거리 계산
                        let distance = calculateDistance(from: leftEyePosition, to: cameraPosition)

                        if distance <= 0.9 { // 50cm or less
                            parent.isTracking = true
                        } else {
                            parent.isTracking = false
                        }
                    } else {
                        parent.isTracking = false
                    }
                } else {
                    parent.isTracking = false
                }
            }
            
            func calculateDistance(from vector1: SIMD3<Float>, to vector2: SIMD3<Float>) -> Float {
                let dx = vector2.x - vector1.x
                let dy = vector2.y - vector1.y
                let dz = vector2.z - vector1.z
                return sqrt(dx*dx + dy*dy + dz*dz)
            }
        }

}
