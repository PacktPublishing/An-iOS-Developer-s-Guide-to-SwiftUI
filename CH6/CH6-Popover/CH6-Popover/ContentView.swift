

import SwiftUI

struct ViewWithAPopover: View {
    @State private var isShowingPopover = false

    var body: some View {
        Button("Show Popover") {
            self.isShowingPopover = true
        }
        .popover(isPresented: $isShowingPopover) {
            Text("This Text is the Popover content")
                .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ViewWithAPopover()
                .padding()
            Text("pushing the button will show a Popover")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
