import SwiftUI

struct HotelConversationView: View {
    @Environment(\.dismiss) private var dismiss
    let chat: RecentChat
    @State private var messages = AppMockData.transcriptMessages

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.hotelCard.opacity(0.85), AppColors.transportCard.opacity(0.95)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 14) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.black.opacity(0.8))
                            .frame(width: 44, height: 44)
                            .background(.white.opacity(0.3))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Text(chat.title)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Spacer()
                    Color.clear.frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(messages) { message in
                            ChatBubbleView(message: message)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                }
            }
            .padding(.top, 6)
        }
        .navigationBarBackButtonHidden(true)
    }
}
