//
//  FlowController.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 23/03/2021.
//

import Foundation
import UIKit

final class FlowController {
    private let viewControllersFactory = ViewControllersFactory()
    private var quotesListNavigationController: UINavigationController?

    func rootViewController() -> UIViewController {
        createRootViewController()
    }

    //MARK: View Controllers creation

    func createRootViewController() -> UIViewController {
        let tabBarController = UITabBarController()
        let quoteOfTheDayViewController = createQuoteOfTheDayViewController()
        let quotesListViewController = createQuotesListViewController()
        tabBarController.setViewControllers([quoteOfTheDayViewController, quotesListViewController], animated: false)
        return tabBarController
    }

    private func createQuotesListViewController() -> UIViewController {
        let quotesListViewController = viewControllersFactory.createQuotesListViewController(actions: quotesListActions)
        let navigationController = UINavigationController(rootViewController: quotesListViewController)
        let tabBarItem = UITabBarItem(title: "Lista", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        quotesListNavigationController = navigationController
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }

    private func createQuoteOfTheDayViewController() -> UIViewController {
        let viewController = viewControllersFactory.createQuoteOfTheDayViewController()
        let tabBarItem = UITabBarItem(title: "Losowe", image: UIImage(systemName: "shuffle"), selectedImage: nil)
        viewController.tabBarItem = tabBarItem
        return viewController
    }

    //MARK: Actions

    private func quotesListActions(action: QuotesListAction) {
        switch action {
            case .selected(let quote):
                let viewController = viewControllersFactory.createQuoteViewController(quote: quote)
                quotesListNavigationController?.pushViewController(viewController, animated: true)
        }
    }
}
