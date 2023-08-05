//
//  ImmersiveViewModel.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/05.
//

import Combine
import RealityKit

// ImmersiveSpace用のViewModel
class ImmersiveViewModel: ObservableObject {
    
    func generateModelEntity(text: String) -> ModelEntity {

        let mesh: MeshResource = .generateText(text,
                                                           extrusionDepth: 0.03,
                                                           font: .systemFont(ofSize: 0.1),
                                                           containerFrame: .zero,
                                                           alignment: .center,
                                                           lineBreakMode: .byWordWrapping) // テキストを生成する


        let material = UnlitMaterial(color: .white) // マテリアルを生成する

        let modelEntity = ModelEntity(mesh: mesh, materials: [material]) // テキストのmodelEntityを生成する
        modelEntity.position = SIMD3(x: -(mesh.bounds.extents.x / 2), y: 1.5, z: -2)

        return modelEntity
    }
}
