//
//  ContentView.swift
//  CH3
//
//  Created by Javohir Muhammad on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [AppRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            HomeView(categories: AppMockData.categories)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .recentChats(let category):
                        RecentChatsListView(category: category, chats: AppMockData.chats(for: category))
                    case .transcript(let chat):
                        LiveTranscriptView(chat: chat)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
