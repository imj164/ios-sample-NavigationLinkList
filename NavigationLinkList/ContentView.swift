//
//  ContentView.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import SwiftUI

// メイン画面
struct ContentView: View {
    // ビュー本体
    var body: some View {
        // 配下のビューでNavigationLinkによる画面遷移を可能とするため、NavigationViewで囲む
        NavigationView {
            // アイテム一覧画面
            ItemListView()
        }
    }
}

#Preview {
    ContentView()
}
