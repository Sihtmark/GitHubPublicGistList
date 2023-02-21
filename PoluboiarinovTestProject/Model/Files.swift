//
//  Files.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

// MARK: - Files
struct Files: Codable, Hashable {
    let lazyLoadHTML: LazyLoadHTML?

    enum CodingKeys: String, CodingKey {
        case lazyLoadHTML = "lazyLoad.html"
    }
}

// MARK: - LazyLoadHTML
struct LazyLoadHTML: Codable, Hashable {
    let filename, type, language: String?
    let rawURL: String?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case filename, type, language
        case rawURL = "raw_url"
        case size
    }
}
