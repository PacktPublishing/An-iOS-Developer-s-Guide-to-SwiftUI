//
//  TabType.swift
//  CH6-CustomTabBar
//

enum Tabs: Int, CaseIterable {
    case moon = 0
    case star
    case triangle
    case square
    
    var tabItem: ItemValue {
        switch self {
        case .moon:
            return ItemValue(image: "moon", selectedImage: "moon.fill", title: "Moon")
        case .star:
            return ItemValue(image: "star", selectedImage: "star.fill", title: "Star")
        case .triangle:
            return ItemValue(image: "triangle", selectedImage: "triangle.fill", title: "Triangle")
        case .square:
            return ItemValue(image: "square", selectedImage: "square.fill", title: "Square")

        }
    }
}
