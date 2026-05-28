import SwiftUI

enum AppColors {
    static let background = Color(.systemGray6)
    static let textPrimary = Color.black.opacity(0.88)
    static let textSecondary = Color.black.opacity(0.52)

    static let transportCard = Color(red: 0.39, green: 0.43, blue: 0.84)
    static let transportIcon = Color(red: 0.26, green: 0.23, blue: 0.80)

    static let storeCard = Color(red: 0.95, green: 0.57, blue: 0.38)
    static let storeIcon = Color(red: 0.93, green: 0.39, blue: 0.12)

    static let hotelCard = Color(red: 0.67, green: 0.43, blue: 0.74)
    static let hotelIcon = Color(red: 0.63, green: 0.26, blue: 0.68)

    static let miscCard = Color(red: 0.73, green: 0.73, blue: 0.76)
    static let miscIcon = Color(red: 0.58, green: 0.58, blue: 0.61)

    static let transcriptGradientTop = Color(red: 0.98, green: 0.61, blue: 0.44)
    static let transcriptGradientBottom = Color(red: 0.35, green: 0.46, blue: 0.88)

    static func cardColor(for category: CategoryType) -> Color {
        switch category {
        case .transport: return transportCard
        case .store: return storeCard
        case .hotel: return hotelCard
        case .misc: return miscCard
        }
    }

    static func iconColor(for category: CategoryType) -> Color {
        switch category {
        case .transport: return transportIcon
        case .store: return storeIcon
        case .hotel: return hotelIcon
        case .misc: return miscIcon
        }
    }
}
