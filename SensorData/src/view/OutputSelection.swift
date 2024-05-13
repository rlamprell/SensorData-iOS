import SwiftUI

enum FilterOption: String, CaseIterable, Identifiable {
    case flask = "Flask"
    case socketio = "socketIO"
    case kafka = "KAFKA"

    var id: String { self.rawValue }
}


struct OutputSelection: View {
    @State private var outputSelection: FilterOption = .flask  // Default to .hi
    let filterOptions = FilterOption.allCases  // All cases of the enum

    var body: some View {
        List {
            Picker(selection: $outputSelection) {
                ForEach(filterOptions) { option in
                    Text(option.rawValue)
                        .tag(option)
                }
            } label: {
                Text("Output:")
            }
            .pickerStyle(MenuPickerStyle())  // This could be .automatic, .segmented, etc., depending on your design requirements.
        }
    }
}

struct OutputSelection_Previews: PreviewProvider {
    static var previews: some View {
        OutputSelection()
    }
}
