import SwiftUI

struct LiveTranscriptView: View {
    @Environment(\.dismiss) private var dismiss
    let chat: RecentChat
    @State private var messages = AppMockData.transcriptMessages
    @State private var inputText = ""
    @State private var micIsActive = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.transcriptGradientTop, AppColors.transcriptGradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 12) {
                TopBarView(
                    title: "Live Transcript",
                    subtitle: nil,
                    showsBack: true,
                    trailingSystemImage: nil,
                    onBack: { dismiss() },
                    onTrailingTap: nil
                )
                .padding(.horizontal, 16)
                .padding(.top, 6)

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(messages) { message in
                            ChatBubbleView(message: message)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.bottom, 6)
                }

                bottomComposer
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private var bottomComposer: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Suggestions")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.92))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule().fill(
                            LinearGradient(
                                colors: [Color(red: 0.64, green: 0.69, blue: 0.97), Color(red: 0.47, green: 0.51, blue: 0.88)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    )
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.top, 8)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(AppMockData.transcriptSuggestions) { suggestion in
                        SuggestionChipView(text: suggestion.text) {
                            messages.append(
                                ChatMessage(text: suggestion.text, isUser: true, hasAudioIcon: true)
                            )
                        }
                    }
                }
                .padding(.horizontal, 10)
            }

            TextField("Enter text", text: $inputText)
                .font(.system(size: 34, weight: .medium, design: .rounded))
                .textFieldStyle(.plain)
                .padding(.horizontal, 14)
                .padding(.top, 8)

            Divider().padding(.horizontal, 14)

            HStack {
                Spacer()
                Button {
                    micIsActive.toggle()
                    let text = micIsActive ? "Listening live for \(chat.title)..." : "Live transcribe paused"
                    messages.append(ChatMessage(text: text, isUser: false, hasAudioIcon: false))
                } label: {
                    Image(systemName: micIsActive ? "waveform" : "mic.fill")
                        .font(.system(size: 38, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 88, height: 88)
                        .background(AppColors.transportCard)
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.bottom, 8)
        }
        .padding(.bottom, 8)
        .background(.white.opacity(0.97))
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }
}
