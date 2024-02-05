//
//  ItemView.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import SwiftUI

// 一覧表示するアイテム1件分のビュー
struct ItemView: View {
    // 表示する対象のアイテム
    var item: Item? = nil

    // ビュー本体
    var body: some View {
        if let item = item {
            // 表示対象アイテムが指定されていれば、その各項目を表示
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
            }
        } else {
            // 指定されていなければ、空表示
            Text("empty")
        }
    }
}

#Preview {
    ItemView(item: Item(name: "Preview", description: "object for preview"))
}
