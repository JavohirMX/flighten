import SwiftUI

struct ChatBubbleView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isUser { Spacer(minLength: 30) }

            VStack(alignment: .leading, spacing: 8) {
                Text(message.text)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.black.opacity(0.86))

                if message.hasAudioIcon {
                    HStack {
                        Spacer()
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundStyle(.black)
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(.white.opacity(0.96))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 3)
            .frame(maxWidth: 290, alignment: .leading)

            if !message.isUser { Spacer(minLength: 30) }
        }
    }
}
