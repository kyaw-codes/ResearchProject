//
//  StaggeredGridLayoutView.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct StaggeredGridLayoutView<Content: View, T: Identifiable>: View where T: Hashable {
    
    var columns: Int
    var spacing: Double
    var list: [T]
    var content: (T) -> Content
    
    init(
        columns: Int = 1,
        spacing: Double = 10.0,
        list: [T],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.columns = columns
        self.spacing = spacing
        self.list = list
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                ForEach(makeGridListItems(columns: columns), id: \.self) { columnItems in
                    LazyVStack(spacing: spacing) {
                        ForEach(columnItems) { item in
                            content(item)
                        }
                    }
                }
            }
        }
    }
    
    private func makeGridListItems(columns: Int) -> [[T]] {
        var gridList: [[T]] = Array(repeating: [], count: columns)
        var currentIndex = 0
        
        for item in list {
            gridList[currentIndex].append(item)
            
            if currentIndex == columns - 1 {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridList
    }
}

struct StaggeredGridLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        StaggeredGridView()
    }
}
