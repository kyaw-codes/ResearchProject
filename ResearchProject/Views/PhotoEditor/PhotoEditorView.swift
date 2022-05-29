//
//  PhotoEditorView.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct PhotoEditorView: View {
    @StateObject var model = DrawingViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = UIImage(data: model.imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    model.cancleImageEditing()
                                } label: {
                                    Image(systemName: "xmark")
                                }
                            }
                        }
                } else {
                    Button {
                        model.showImagePicker.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 70)
                            .background(.yellow)
                            .clipShape(Circle())
                    }

                }
            }
            .navigationTitle("Photo Editor")
        }
        .sheet(isPresented: $model.showImagePicker) {
            ImagePicker(
                showPicker: $model.showImagePicker,
                imageData: $model.imageData
            )
        }
    }
}

struct PhotoEditorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoEditorView()
    }
}
