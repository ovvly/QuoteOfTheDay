//
//  DependencyManager.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 23/03/2021.
//

import Foundation

final class Dependencies {
    lazy var quotesProvider: QuotesProvider = {
        RandomListQuotesProvider(quotesFetcher: quotesFetcher)
    }()
    
    var quotesFetcher: QuotesFetcher {
        JSONQuotesFetcher()
    }

    var categoriesProvider: QuoteCategoriesProvider {
        JSONQuoteCategoriesProvider(quotesFetcher: quotesFetcher)
    }
}

