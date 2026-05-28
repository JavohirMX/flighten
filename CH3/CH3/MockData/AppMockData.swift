import Foundation

enum AppMockData {
    static let categories: [CategoryCardModel] = [
        CategoryCardModel(type: .transport, title: "Transport", iconSystemName: "airplane", destination: .recentChats(.transport)),
        CategoryCardModel(type: .store, title: "Store", iconSystemName: "cart.fill", destination: .recentChats(.store)),
        CategoryCardModel(type: .hotel, title: "Hotel", iconSystemName: "bed.double.fill", destination: .recentChats(.hotel)),
        CategoryCardModel(type: .misc, title: "Misc", iconSystemName: "message.fill", destination: .recentChats(.misc))
    ]

    static let recentChatsByCategory: [CategoryType: [RecentChat]] = [
        .hotel: [
            RecentChat(category: .hotel, title: "Famous Hotel", subtitle: "Kuta, Bali", dateText: "Jan 7, 2026"),
            RecentChat(category: .hotel, title: "Sunrise Resort", subtitle: "Nusa Dua, Bali", dateText: "Jan 6, 2026"),
            RecentChat(category: .hotel, title: "Kuta Plaza", subtitle: "Kuta, Bali", dateText: "Jan 5, 2026"),
            RecentChat(category: .hotel, title: "Ocean Villa", subtitle: "Uluwatu, Bali", dateText: "Jan 4, 2026")
        ],
        .transport: [
            RecentChat(category: .transport, title: "Airport Check-In", subtitle: "Ngurah Rai Airport", dateText: "Jan 7, 2026"),
            RecentChat(category: .transport, title: "Train Ticket Desk", subtitle: "Jakarta Station", dateText: "Jan 6, 2026"),
            RecentChat(category: .transport, title: "Taxi Pickup", subtitle: "City Center", dateText: "Jan 5, 2026"),
            RecentChat(category: .transport, title: "Bus Terminal", subtitle: "Ubud Route", dateText: "Jan 4, 2026")
        ],
        .store: [
            RecentChat(category: .store, title: "Grocery Checkout", subtitle: "Local Market", dateText: "Jan 7, 2026"),
            RecentChat(category: .store, title: "Clothing Store", subtitle: "Beachwalk Mall", dateText: "Jan 6, 2026"),
            RecentChat(category: .store, title: "Pharmacy Counter", subtitle: "Kuta Main Road", dateText: "Jan 5, 2026"),
            RecentChat(category: .store, title: "Souvenir Shop", subtitle: "Ubud Center", dateText: "Jan 4, 2026")
        ],
        .misc: [
            RecentChat(category: .misc, title: "Directions Help", subtitle: "Tourist Info Point", dateText: "Jan 7, 2026"),
            RecentChat(category: .misc, title: "Restaurant Request", subtitle: "Jimbaran Beach", dateText: "Jan 6, 2026"),
            RecentChat(category: .misc, title: "Emergency Support", subtitle: "Hospital Desk", dateText: "Jan 5, 2026"),
            RecentChat(category: .misc, title: "Public Service", subtitle: "City Office", dateText: "Jan 4, 2026")
        ]
    ]

    static let transcriptMessages: [ChatMessage] = [
        ChatMessage(text: "Hi, i'm deaf. Can you speak to my phone please?", isUser: true, hasAudioIcon: true),
        ChatMessage(text: "Sure. What can i help you?", isUser: false, hasAudioIcon: false),
        ChatMessage(text: "Can i have a window seat please?", isUser: true, hasAudioIcon: true),
        ChatMessage(text: "Yes, sure. We have one window seat left", isUser: false, hasAudioIcon: false),
        ChatMessage(text: "Thank you. What is my seat number?", isUser: true, hasAudioIcon: true)
    ]

    static let transcriptSuggestions: [PhraseSuggestion] = [
        PhraseSuggestion(text: "Perfect. Thank you"),
        PhraseSuggestion(text: "Thank you. What is my seat number?"),
        PhraseSuggestion(text: "Can i get a seat near the toilet?"),
        PhraseSuggestion(text: "Can i bring this suitcase to the cabin?")
    ]

    static let storeGroups: [PhraseGroup] = [
        PhraseGroup(title: "Checkout", phrases: [
            "How much is this item?",
            "Can i pay by card?",
            "Do you have a receipt?"
        ]),
        PhraseGroup(title: "Help", phrases: [
            "Can you show me where this is?",
            "Do you have a different size?",
            "Can i exchange this later?"
        ])
    ]

    static let miscGroups: [PhraseGroup] = [
        PhraseGroup(title: "Essentials", phrases: [
            "Please call a taxi for me.",
            "Can you write that down?",
            "I need help with directions."
        ]),
        PhraseGroup(title: "Recent", phrases: [
            "Where is the nearest pharmacy?",
            "Can you speak more slowly?",
            "Thank you for your help."
        ])
    ]

    static func chats(for category: CategoryType) -> [RecentChat] {
        recentChatsByCategory[category] ?? []
    }
}
