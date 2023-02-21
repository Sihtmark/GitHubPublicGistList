//
//  GistStruct.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import Foundation

struct Gist: Codable, Hashable {
    let url, forksURL, commitsURL: String?
    let id, nodeID: String?
    let gitPullURL, gitPushURL: String?
    let htmlURL: String?
    let files: Files?
    let gistPublic: Bool?
    let createdAt, updatedAt: Date?
    let description: String?
    let comments: Int?
    let user: String?
    let commentsURL: String?
    let owner: Owner?
    let truncated: Bool?

    enum CodingKeys: String, CodingKey {
        case url
        case forksURL = "forks_url"
        case commitsURL = "commits_url"
        case id
        case nodeID = "node_id"
        case gitPullURL = "git_pull_url"
        case gitPushURL = "git_push_url"
        case htmlURL = "html_url"
        case files
        case gistPublic = "public"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case description, comments, user
        case commentsURL = "comments_url"
        case owner, truncated
    }
}
