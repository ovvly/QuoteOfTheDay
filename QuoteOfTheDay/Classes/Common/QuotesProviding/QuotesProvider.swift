//
//  QuotesProvider.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 04/05/2021.
//

import Foundation

protocol QuotesProvider {
    func firstQuote() -> Quote?
    func nextQuote() -> Quote?
    func previousQuote() -> Quote?
}

final class RandomListQuotesProvider: QuotesProvider {
    private let quotes: [Quote]
    private var index = 0
    
    init(quotesFetcher: QuotesFetcher) {
        self.quotes = quotesFetcher.fetchQuotes().shuffled()
    }
    
    func firstQuote() -> Quote? {
        if quotes.isEmpty { return nil }
        return quotes.first
    }
    
    func nextQuote() -> Quote? {
        if quotes.isEmpty { return nil }
        index += 1
        let quote = quotes[index % quotes.count]
        return quote
    }
    
    func previousQuote() -> Quote? {
        if quotes.isEmpty { return nil }
        guard index > 0 else { return nil }
        index -= 1
        let quote = quotes[index % quotes.count]
        return quote
    }
}
