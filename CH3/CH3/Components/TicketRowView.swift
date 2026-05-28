import SwiftUI

struct TicketRowView: View {
    let chat: RecentChat

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(Color.white)
                .frame(width: 56, height: 56)
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(Color.red.opacity(0.65))
                        .frame(height: 26)
                }

            VStack(alignment: .leading, spacing: 2) {
                Text(chat.title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(AppColors.textPrimary)
                Text(chat.subtitle)
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textPrimary)
                Text(chat.dateText)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }

            Spacer()

            Image(systemName: iconName(for: chat.category))
                .font(.system(size: 44, weight: .bold))
                .foregroundStyle(AppColors.iconColor(for: chat.category).opacity(0.15))
                .padding(.trailing, 6)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(.white.opacity(0.94))
        .overlay(alignment: .top) {
            Rectangle()
                .fill(AppColors.cardColor(for: chat.category))
                .frame(height: 8)
                .padding(.leading, 80)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.09), radius: 8, x: 0, y: 4)
    }

    private func iconName(for category: CategoryType) -> String {
        switch category {
        case .transport: return "airplane"
        case .store: return "cart.fill"
        case .hotel: return "bed.double.fill"
        case .misc: return "message.fill"
        }
    }
}
