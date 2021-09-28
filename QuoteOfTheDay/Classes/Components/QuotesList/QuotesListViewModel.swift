//
//  QuotesListViewModel.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 05/05/2021.
//

import Foundation
import Combine

final class QuotesListViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var categories: [QuoteCategory] = []
    @Published var presentationOptions: [PresentationOption] = []
    @Published var selectedCategory: QuoteCategory?
    @Published var presentationType = PresentationOption.author

    init(quotes: [Quote] = [], categories: [QuoteCategory] = [], presentationOptions: [PresentationOption] = PresentationOption.allCases,
         selectedCategory: QuoteCategory? = nil, presentationType: PresentationOption = .author) {
        self.quotes = quotes
        self.categories = categories
        self.presentationOptions = presentationOptions
        self.selectedCategory = selectedCategory
        self.presentationType = presentationType
    }
}

enum PresentationOption: CaseIterable {
    case author
    case quote
    
    var name: String {
        switch self {
        case .author: return L10n.QuotesList.Settings.ViewType.author
        case .quote: return L10n.QuotesList.Settings.ViewType.quote
        }
    }
}

typealias QuoteCategory = String
