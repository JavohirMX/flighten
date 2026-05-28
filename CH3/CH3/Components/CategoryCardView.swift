import SwiftUI

struct CategoryCardView: View {
    let model: CategoryCardModel

    private var cardColor: Color {
        AppColors.cardColor(for: model.type)
    }

    private var iconColor: Color {
        AppColors.iconColor(for: model.type)
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(cardColor)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: model.iconSystemName)
                        .font(.system(size: 68, weight: .bold))
                        .foregroundStyle(iconColor.opacity(0.9))
                        .padding(16)
                }

            Text(model.title)
                .font(AppTypography.cardTitle)
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .padding(16)
        }
        .frame(height: 200)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
