//
// Created by Jakub Sowa on 05/07/2021.
//

import Foundation

protocol QuoteCategoriesProvider {
    func fetchCategories() -> [QuoteCategory]
}

final class JSONQuoteCategoriesProvider: QuoteCategoriesProvider {
    private let quotesFetcher: QuotesFetcher

    init(quotesFetcher: QuotesFetcher) {
        self.quotesFetcher = quotesFetcher
    }

    func fetchCategories() -> [QuoteCategory] {
        let quotes = quotesFetcher.fetchQuotes()
        var categories = Set<QuoteCategory>()
        quotes.forEach { quote in
            categories.formUnion(quote.tags ?? [])
        }
        return Array(categories).sorted(by: <).filter { !$0.isEmpty }
    }
}
