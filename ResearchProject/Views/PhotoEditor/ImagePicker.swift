//
//  ImagePicker.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var showPicker: Bool
    @Binding var imageData: Data
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let imageData = (info[.originalImage] as? UIImage)?.pngData() {
                parent.imageData = imageData
                parent.showPicker.toggle()
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showPicker.toggle()
        }
    }
}
