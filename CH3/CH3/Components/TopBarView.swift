import SwiftUI

struct TopBarView: View {
    let title: String?
    let subtitle: String?
    let showsBack: Bool
    let trailingSystemImage: String?
    let onBack: (() -> Void)?
    let onTrailingTap: (() -> Void)?

    var body: some View {
        VStack(spacing: 16) {
            Capsule()
                .fill(Color.black.opacity(0.2))
                .frame(width: 54, height: 6)
                .opacity(title == nil ? 1 : 0)

            HStack(alignment: .center) {
                if showsBack {
                    Button(action: { onBack?() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.black.opacity(0.8))
                            .frame(width: 44, height: 44)
                            .background(Color.black.opacity(0.08))
                            .clipShape(Circle())
                    }
                } else {
                    Spacer().frame(width: 44)
                }

                Spacer()

                if let title {
                    Text(title)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }

                Spacer()

                if let trailingSystemImage {
                    Button(action: { onTrailingTap?() }) {
                        Image(systemName: trailingSystemImage)
                            .font(.system(size: 22, weight: .medium))
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                            .background(Color(red: 0.67, green: 0.43, blue: 0.74))
                            .clipShape(Circle())
                    }
                } else {
                    Spacer().frame(width: 44)
                }
            }

            if let subtitle {
                Text(subtitle)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.95))
            }
        }
    }
}
