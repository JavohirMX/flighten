import SwiftUI

struct StorePhrasesView: View {
    @Environment(\.dismiss) private var dismiss
    let groups: [PhraseGroup]
    @State private var spokenText = "Tap any phrase to add it below."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
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
                }

                Text("Store")
                    .font(AppTypography.heroTitle)
                    .foregroundStyle(AppColors.textPrimary)

                Text(spokenText)
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textSecondary)
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .elevatedCard()

                ForEach(groups) { group in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(group.title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))

                        ForEach(group.phrases, id: \.self) { phrase in
                            Button {
                                spokenText = phrase
                            } label: {
                                Text(phrase)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(AppColors.textPrimary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)
                                    .elevatedCard()
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .background(AppColors.background.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}
