//
//  ItemDetailView.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import SwiftUI

// アイテム詳細・編集画面
struct ItemDetailView: View {
    // 画面を閉じる機能
    @Environment(\.dismiss) private var dismiss

    // 表示対象のアイテム
    var item: Item? = nil
    // 保存を行った際に呼び出すコールバック
    var onSave: ((Item) -> Void)? = nil

    // 各入力文字列
    @State private var name = ""
    @State private var description = ""

    // ビュー本体
    var body: some View {
        // 入力部
        VStack(alignment: .leading) {
            // 名称の入力部
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            // 説明の入力部
            TextField("Description", text: $description)
                .textFieldStyle(.roundedBorder)
            // 余白（上詰め）
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail / Edit")
        // ツールバー部
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // 保存ボタン
                Button(action: {
                    if let item = item {
                        // このビューにアイテムが渡されていれば、それをコピーした（idを引き継いだ）アイテムを返す
                        onSave?(Item(id: item.id, name: name, description: description))
                    } else {
                        // アイテムが渡されていなければ、新しく作成したアイテムを返す
                        onSave?(Item(name: name, description: description))
                    }
                    // 画面を閉じる
                    dismiss()
                }) {
                    Text("Save")
                }
            }
        }
        // 画面表示時に各入力文字列を設定
        .onAppear {
            if let item = item {
                name = item.name
                description = item.description
            }
        }
    }
}

#Preview {
    ItemDetailView()
}
