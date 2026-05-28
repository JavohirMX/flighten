import Foundation

enum AppRoute: Hashable {
    case recentChats(CategoryType)
    case transcript(RecentChat)
}
