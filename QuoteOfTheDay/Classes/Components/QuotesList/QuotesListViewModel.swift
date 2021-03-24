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

enum PresentationOption: String, CaseIterable {
    case author = "Autor"
    case quote = "Cytat"
}

typealias QuoteCategory = String
