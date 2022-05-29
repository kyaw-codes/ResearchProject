//
//  StaggeredGridView.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct StaggeredGridView: View {
    
    @State private var columns: Int = 1
    @Namespace var animation
    
    private let list = (1 ... 1000).map { _ in StaggeredGridItem(image: String(describing: "pic\(Int.random(in: 1 ... 14))")) }
    
    var body: some View {
        NavigationView {
            StaggeredGridLayoutView(columns: columns, list: list) { item in
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: item.id, in: animation)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            columns = max(columns - 1, 1)
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Button {
                            columns += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Staggered Grid")
            .animation(.spring(), value: columns)
        }
    }
}

struct StaggeredGridView_Previews: PreviewProvider {
    static var previews: some View {
        StaggeredGridView()
    }
}
