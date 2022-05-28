//
//  TabItemView.swift
//  ResearchProject
//
//  Created by Kyaw Zay Ya Lin Tun on 29/05/2022.
//

import SwiftUI

struct TabItemView: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack {
            Text(title)
            Image(systemName: image)
        }
    }
}
