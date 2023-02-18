//
//  HomeView.swift
//  CH6-SimpleTabBar
//
//  Created by Michele Fadda on 07/02/2023.
//

import SwiftUI

struct ViewA:
    View {
    var body: some View {
            Text("This is View 1")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
                .padding(.all)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }

struct ViewB:
    View {
    var body: some View {
        Text("This is View 2")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.red)
            .padding(.all)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
}

struct ViewC:
    View {
    var body: some View {
        Text("This is View 3")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.brown)
            .padding(.all)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct ViewD:
    View {
    var body: some View {
        Text("This is View 4")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.purple)
            .padding(.all)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct ViewE:
    View {
    var body: some View {
        Text("This is View 5")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.teal)
            .padding(.all)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
   }
}


struct HomeView: View {
    var body: some View {
        TabView{
            ViewA().tabItem{
                Label("Menu 1", systemImage: "square")
            }
            ViewB().tabItem{
                Label("Menu 2", systemImage: "circle")
            }
            ViewC().tabItem{
                Label("Menu 3", systemImage: "triangle")
            }
            ViewD().tabItem{
                Label("Menu 4", systemImage: "hexagon")
            }
            ViewE().tabItem{
                Label("Menu 5", systemImage: "moon")
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
