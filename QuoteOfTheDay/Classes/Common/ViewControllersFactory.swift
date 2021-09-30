//
//  ViewControllersFactory.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 23/03/2021.
//

import Foundation
import UIKit
import SwiftUI

final class ViewControllersFactory {
    private let dependencyManager = Dependencies()
    
    func createQuoteOfTheDayViewController() -> UIViewController {
        let viewController = QuotesPageViewController(quotesProvider: dependencyManager.quotesProvider, pageViewControllerBuilder: createQuoteViewController)
        return viewController
    }

    func createQuotesListViewController(actions: @escaping (QuotesListAction) -> Void) -> UIViewController {
        let interactor = DefaultQuotesListInteractor(quotesFetcher: dependencyManager.quotesFetcher,
                categoriesProvider: dependencyManager.categoriesProvider, actions: actions)
        let view = QuotesListView(viewModel: interactor.viewModel, interactor: interactor)
        return UIHostingController(rootView: view)
    }

    func createQuoteViewController(quote: Quote) -> UIViewController {
        let view = QuoteView(quote: quote)
        return UIHostingController(rootView: view)
    }

    func createInfoViewController() -> UIViewController {
        let view = InfoView()
        return UIHostingController(rootView: view)
    }
}
