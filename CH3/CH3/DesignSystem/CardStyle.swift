import SwiftUI

struct ElevatedCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white.opacity(0.95))
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: .black.opacity(0.09), radius: 10, x: 0, y: 4)
    }
}

extension View {
    func elevatedCard() -> some View {
        modifier(ElevatedCardStyle())
    }
}
