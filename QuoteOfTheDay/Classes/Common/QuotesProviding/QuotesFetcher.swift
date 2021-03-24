//
// Created by Jakub Sowa on 24/03/2021.
//

import Foundation

protocol QuotesFetcher {
    func fetchQuotes() -> [Quote]
}

final class JSONQuotesFetcher: QuotesFetcher {
    func fetchQuotes() -> [Quote] {
        guard let data = loadDataFromJson() else { return [] }
        guard let mottos =  try? JSONDecoder().decode([Quote].self, from: data) else { return [] }
        return mottos
    }

    private func loadDataFromJson() -> Data? {
        guard let resourcePath = Bundle.main.path(forResource: "quotes", ofType: "json") else { return nil }
        let url = URL(fileURLWithPath: resourcePath)
        guard let data =  try? Data(contentsOf: url) else { return nil }
        return data
    }
}
