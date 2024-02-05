//
//  Item.swift
//  NavigationLinkList
//
//  Created by Hiroshi IMAJO on 2024/02/05.
//

import Foundation

// 表示対象となるアイテムの構造体、ForEachによる一覧表示を可能とするため、Identifiableにする
struct Item: Identifiable {
    // 識別子（ID）
    var id = UUID()
    // 名称
    var name = ""
    // 説明
    var description = ""
}
