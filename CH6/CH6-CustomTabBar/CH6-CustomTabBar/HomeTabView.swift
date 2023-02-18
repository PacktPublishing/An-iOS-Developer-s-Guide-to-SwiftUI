//
//  MainTabView.swift
//  CH6-CustomTabBar
//
//  Created by Michele Fadda on 07/02/2023.
//

import SwiftUI

struct StarView: View {
    var body: some View {
        Text("This is a Star")
            .padding(.all)
            .background(.regularMaterial)
            .cornerRadius(8.0)
            .shadow(color: .gray,radius: 5,x: 2.0,y: 2)
    }
}

struct MoonView: View {
    var body: some View {
        Text("This is a Moon")
            .padding(.all)
            .cornerRadius(8.0)
            .background(.regularMaterial)
            .shadow(color: .gray,radius: 5,x: 2.0,y: 2)
    }
}

struct TriangleView: View {
    var body: some View {
        Text("This is a Triangle")
            .padding(.all)
            .cornerRadius(8.0)
            .background(.regularMaterial)
            .shadow(color: .gray,radius: 5,x: 2.0,y: 2)
    }
}

struct SquareView: View {
    var body: some View {
        Text("This is a Square")
            .padding(.all)
            .cornerRadius(8.0)
            .background(.regularMaterial)
            .shadow(color: .gray,radius: 5,x: 2.0,y: 2)
    }
}

struct CustomTabView<Content: View>: View {
    
    let tabs: [ItemValue]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            }
            VStack {
                MyTabView(items: tabs, selectedIndex: $selectedIndex)
                Spacer()
            }
            .padding(.bottom, 8)
        }
    }
}

struct HomeTabView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: Tabs.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = Tabs(rawValue: index) ?? .star
            tabView(type: type)
        }
    }
    
    @ViewBuilder
    func tabView(type: Tabs) -> some View {
        switch type {
        case .star:
            StarView()
        case .moon:
            MoonView()
        case .triangle:
            TriangleView()
        case .square:
            SquareView()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
