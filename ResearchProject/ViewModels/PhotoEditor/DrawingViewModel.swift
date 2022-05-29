//
//  DrawingViewModel.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

class DrawingViewModel: ObservableObject {
    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)
    
    func cancleImageEditing() {
        imageData = Data(count: 0)
    }
}
