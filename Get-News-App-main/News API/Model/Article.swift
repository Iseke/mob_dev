//
//  Article.swift
//  News API
//
//  Created by Islam Abdukarimov on 02.05.2022.
//

import Foundation

public struct Source: Decodable {
    let id: String?
    let name: String?
}

public struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

public struct ArticleList: Decodable{
    public var articles: [Article]
}
