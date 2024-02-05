//
//  ItemListView.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import SwiftUI

// アイテム一覧画面
struct ItemListView: View {
    // アイテム管理オブジェクト
    @ObservedObject private var manager = ItemManager()

    // ビュー本体
    var body: some View {
        // 一覧部
        List {
            // 各アイテム（ナビゲーションリンク付き）
            ForEach(manager.items) { item in
                // アイテムを選択すると、アイテム詳細画面へ遷移
                NavigationLink(destination: ItemDetailView(item: item, onRegister: { newItem in
                    // ItemDetailView()で保存が行われたら、アイテムを更新する
                    manager.update(newItem)
                })) {
                    // アイテム画面
                    ItemView(item: item)
                }
            }
            // 削除操作
            .onDelete { indexSet in
                // アイテムを削除する
                manager.remove(indexSet: indexSet)
            }
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("List")
        // ツールバー部
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // アイテムの新規追加（アイテム詳細画面へ遷移）
                NavigationLink(destination: ItemDetailView(item: nil, onRegister: { newItem in
                    // ItemDetailView()で保存が行われたら、アイテムを更新する（この場合は新規追加される）
                    manager.update(newItem)
                })) {
                    // ツールバー画像
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ItemListView()
}
