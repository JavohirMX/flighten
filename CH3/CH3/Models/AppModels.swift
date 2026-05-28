import Foundation

enum CategoryType: String, CaseIterable, Identifiable, Hashable {
    case transport = "Transport"
    case store = "Store"
    case hotel = "Hotel"
    case misc = "Misc"

    var id: String { rawValue }
}

struct CategoryCardModel: Identifiable, Hashable {
    let id = UUID()
    let type: CategoryType
    let title: String
    let iconSystemName: String
    let destination: AppRoute
}

struct RecentChat: Identifiable, Hashable {
    let id = UUID()
    let category: CategoryType
    let title: String
    let subtitle: String
    let dateText: String
}

struct ChatMessage: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let hasAudioIcon: Bool
}

struct PhraseSuggestion: Identifiable, Hashable {
    let id = UUID()
    let text: String
}

struct PhraseGroup: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let phrases: [String]
}
