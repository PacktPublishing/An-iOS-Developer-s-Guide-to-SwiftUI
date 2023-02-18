//
//  TabItemView.swift
//  CH6-CustomTabBar
//
//  Created by Michele Fadda on 07/02/2023.
//

import SwiftUI

struct MyTabItemView: View {
    let itemContent: ItemValue
    let selected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: selected ? itemContent.selectedImage : itemContent.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Spacer().frame(height: 6)
            
            Text(itemContent.title)
                .fontWeight(selected ? .bold : .light )
                .foregroundColor(selected ? .red : .gray)
                .font(.system(size: 16))
        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabItemView(itemContent: ItemValue(image: "moon", selectedImage: "moon.fill", title: "moon"), selected: true)
    }
}
