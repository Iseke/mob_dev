//
//  Model.swift
//  News API
//
//  Created by Islam Abdukarimov on 02.05.2022.
//

import Foundation

public struct NewsSource: Decodable, Hashable {
    let id: String?
    let name: String?
    let category: String?
}

public struct AllNewsSources: Decodable {
    let sources: [NewsSource]
}
