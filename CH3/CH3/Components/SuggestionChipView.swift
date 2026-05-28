import SwiftUI

struct SuggestionChipView: View {
    let text: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(text)
                .suggestionChip()
        }
        .buttonStyle(.plain)
    }
}
