//
//  TabBottomView.swift
//  CH6-CustomTabBar
//
//  Created by Michele Fadda on 07/02/2023.
//

import SwiftUI

struct MyTabView: View {
    
    let items: [ItemValue]
    var height: CGFloat = 72
    var width: CGFloat = UIScreen.main.bounds.width - 28
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    MyTabItemView(itemContent: item, selected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3, x: 1, y: 2)
    }
}

struct TabBottomView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView(
          items: [
            ItemValue(image: "star", selectedImage: "star.fill", title: "Star"),
            ItemValue(image: "triangle", selectedImage: "triangle.fill", title: "Triangle"),
            ItemValue(image: "circle", selectedImage: "circle.fill", title: "Circle"),ItemValue(image: "square", selectedImage: "square.fill", title: "Square")],
          selectedIndex: .constant(0))

    }
}
