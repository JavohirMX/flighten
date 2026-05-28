import SwiftUI

struct MiscUtilitiesView: View {
    @Environment(\.dismiss) private var dismiss
    let groups: [PhraseGroup]
    @State private var recentSelections: [String] = []

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

                Text("Misc")
                    .font(AppTypography.heroTitle)
                    .foregroundStyle(AppColors.textPrimary)

                if !recentSelections.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Recent taps")
                            .font(.system(size: 22, weight: .semibold))
                        Text(recentSelections.joined(separator: "  •  "))
                            .font(.system(size: 17))
                            .foregroundStyle(AppColors.textSecondary)
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .elevatedCard()
                }

                ForEach(groups) { group in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(group.title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                        ForEach(group.phrases, id: \.self) { phrase in
                            Button {
                                recentSelections.insert(phrase, at: 0)
                                recentSelections = Array(recentSelections.prefix(3))
                            } label: {
                                Text(phrase)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(AppColors.textPrimary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 12)
                                    .background(AppColors.miscCard.opacity(0.45))
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
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
