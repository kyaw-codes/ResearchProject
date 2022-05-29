//
//  TabContainerView.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct TabContainerView: View {
    let appearance: UITabBarAppearance = UITabBarAppearance()
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            StaggeredGridView()
                .tabItem {
                    TabItemView(title: "Grid", image: "rectangle.grid.3x2.fill")
                }
            
            VisualLayoutGuideView()
                .tabItem {
                    TabItemView(title: "Guide", image: "cube.transparent.fill")
                }
            
            PhotoEditorView()
                .tabItem {
                    TabItemView(title: "Photo Editor", image: "paintbrush.pointed.fill")
                }
        }
    }
}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
    }
}
