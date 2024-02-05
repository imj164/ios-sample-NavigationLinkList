//
//  ItemManager.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import Foundation

// 複数のアイテムを管理するクラス
final class ItemManager: ObservableObject {
    // アイテムリスト
    @Published var items: [Item] = []

    // アイテムの追加・更新
    func update(_ item: Item) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            // 登録しようとしているアイテムがアイテムリストに存在するなら（識別子があるなら）、リストを更新
            items[index] = item
        } else {
            // そうでなければ新規追加
            items.insert(item, at: 0)
        }
    }

    // アイテムの削除
    func remove(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
