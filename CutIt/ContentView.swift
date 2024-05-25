import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(
                        .adaptive(
                            minimum: 200,
                            maximum: 300
                        )
                    )]
                ) {
                    Text("Test")
                }
            }

            HStack {
                Button("Make a Full Screenshot") {

                }

                Button("Make a Window Screenshot") {

                }

                Button("Make a Area Screenshot") {

                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
