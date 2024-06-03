import SwiftUI

struct ShortcutsView: View {
    @State private var screenshotArea = ""
    @State private var screenshotWindow = ""
    @State private var screenshotFull = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Keyboard")
                .font(.title2)

            HStack {
                VStack(alignment: .trailing) {
                    Text("Screenshot Area:")
                        .padding(4)
                    Text("Screenshot Window:")
                        .padding(4)
                    Text("Screenshot Full Screen:")
                        .padding(4)
                }

                VStack {
                    TextField(text: $screenshotArea) {
                        Text("􀆕􀆔3")
                    }
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        HStack {
                            Spacer()
                            Button {
                                screenshotArea = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                            }
                        }
                    }

                    TextField(text: $screenshotArea) {
                        Text("􀆕􀆔4")
                    }
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        HStack {
                            Spacer()
                            Button {
                                screenshotArea = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                            }
                        }
                    }

                    TextField(text: $screenshotArea) {
                        Text("􀆕􀆔5")
                    }
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        HStack {
                            Spacer()
                            Button {
                                screenshotArea = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                            }
                        }
                    }
                }
            }
        }
        .frame(width: 350, 
               height: 160)
    }
}

#Preview {
    ShortcutsView()
}
