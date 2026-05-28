import SwiftUI

struct SuggestionChipStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .foregroundStyle(Color(red: 0.39, green: 0.44, blue: 0.86))
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}

extension View {
    func suggestionChip() -> some View {
        modifier(SuggestionChipStyle())
    }
}
