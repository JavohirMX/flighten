import SwiftUI

struct RecentChatsListView: View {
    @Environment(\.dismiss) private var dismiss
    let category: CategoryType
    let chats: [RecentChat]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.black.opacity(0.8))
                            .frame(width: 44, height: 44)
                            .background(Color.black.opacity(0.08))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Button {} label: {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                            .background(AppColors.cardColor(for: category))
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 4)

                Text(category.rawValue)
                    .font(AppTypography.heroTitle)
                    .foregroundStyle(AppColors.textPrimary)
                Text("Past chats related to \(category.rawValue)")
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textSecondary)
                    .padding(.top, -8)
                    .padding(.bottom, 8)

                ForEach(chats) { chat in
                    NavigationLink(value: AppRoute.transcript(chat)) {
                        TicketRowView(chat: chat)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}
