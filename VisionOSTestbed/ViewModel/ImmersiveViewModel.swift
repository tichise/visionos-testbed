//
//  ImmersiveViewModel.swift
//  VisionOSTestbed
//
//  Created by tichise on 2023/08/05.
//

import Combine
import RealityKit
import Foundation

// ImmersiveSpace用のViewModel
class ImmersiveViewModel: ObservableObject {
    
    func downloadModel(from url: URL, completion: @escaping (Result<URL, Error>) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) { (tempURL, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let tempURL = tempURL else {
                let error = NSError(domain: "YourErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "No file location"])
                completion(.failure(error))
                return
            }
            
            let fileManager = FileManager.default
            let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let destinationURL = cacheDirectory.appendingPathComponent(tempURL.lastPathComponent)
            
            do {
                if fileManager.fileExists(atPath: destinationURL.path) {
                    try fileManager.removeItem(at: destinationURL)
                }
                try fileManager.copyItem(at: tempURL, to: destinationURL)
                completion(.success(destinationURL))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    // 3Dモデルを生成する
    func generateModelEntity(usdz: URL) -> ModelEntity? {
        

        guard let modelEntity = try? ModelEntity.load(contentsOf: usdz) else {
            return nil
        }

        modelEntity.position = SIMD3(x: 0, y: 0, z: -2)

        return modelEntity as! ModelEntity
    }
    
    // テキストを生成する
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
