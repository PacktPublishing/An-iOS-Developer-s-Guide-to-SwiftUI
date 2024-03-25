//
//  ContentView.swift
//  RefactoringViews
//
//  Created by Michele Fadda on 25/03/2024.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        VStack {
            //ExtractedView()
            ScreenHeader()
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//struct ExtractedView: View {
//    var body: some View {
//        VStack {
//            Text("Title")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.red)
//            Text("subtitle")
//                .font(.headline)
//                .fontWeight(.bold)
//            Text("This is a rather longish description on multiple lines of text")
//        }
//    }
//}

struct ScreenHeader: View {
    var body: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
            Text("subtitle")
                .font(.headline)
                .fontWeight(.bold)
            Text("This is a rather longish description on multiple lines of text")
        }
    }
}


#Preview {
    ContentView()
}
