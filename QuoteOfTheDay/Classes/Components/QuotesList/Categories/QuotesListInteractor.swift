//
//  QuotesListInteractor.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 05/05/2021.
//

import Foundation

protocol QuotesListInteractor {
    func selected(quote: Quote)
    func selected(category: QuoteCategory)
    func selected(presentationOption: PresentationOption)
}

enum QuotesListAction {
    case selected(Quote)
}

final class DefaultQuotesListInteractor: QuotesListInteractor {
    private let actions: ((QuotesListAction) -> Void)
    var viewModel: QuotesListViewModel
    private let allQuotes: [Quote]
    
    init(quotesFetcher: QuotesFetcher, categoriesProvider: QuoteCategoriesProvider, actions: @escaping ((QuotesListAction) -> Void)) {
        self.allQuotes = quotesFetcher.fetchQuotes()
        let categories = categoriesProvider.fetchCategories()
        self.viewModel = QuotesListViewModel(quotes: allQuotes, categories: categories)
        self.actions = actions
    }

    func selected(quote: Quote) {
        actions(.selected(quote))
    }

    func selected(category: QuoteCategory) {
        if category == viewModel.selectedCategory {
            viewModel.selectedCategory = nil
        } else {
            viewModel.selectedCategory = category
        }
        updateQuotesList()
    }

    func selected(presentationOption: PresentationOption) {
        viewModel.presentationType = presentationOption
    }

    private func updateQuotesList() {
        guard let category = viewModel.selectedCategory else {
            viewModel.quotes = allQuotes
            return
        }
        viewModel.quotes = allQuotes.filter { $0.tags?.contains(category) ?? false }
    }
}
