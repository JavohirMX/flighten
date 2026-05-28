import SwiftUI

struct HomeView: View {
    let categories: [CategoryCardModel]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Hello, Hans!")
                            .font(AppTypography.greeting)
                            .foregroundStyle(AppColors.textPrimary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                        Text("What are your plans today?")
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                    Spacer()
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 42, height: 42)
                        .padding(.top, 8)
                }
                .padding(.bottom, 4)

                LazyVGrid(
                    columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)],
                    spacing: 14
                ) {
                    ForEach(categories) { item in
                        NavigationLink(value: item.destination) {
                            CategoryCardView(model: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .padding(.bottom, 30)
        }
        .background(AppColors.background.ignoresSafeArea())
    }
}
