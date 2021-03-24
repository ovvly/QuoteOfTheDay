//
// Created by Jakub Sowa on 24/03/2021.
//

import Foundation

struct Quote: Identifiable {
    let id = UUID()
    let text: String
    let author: String
    let tags: [Tag]?
}

extension Quote: Codable {
    private enum CodingKeys: String, CodingKey {
        case text
        case author
        case tags
    }
}

typealias Tag = String
