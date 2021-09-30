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
        let infoViewController = createInfoViewController()
        tabBarController.setViewControllers([quoteOfTheDayViewController, quotesListViewController, infoViewController], animated: false)
        return tabBarController
    }

    private func createInfoViewController() -> UIViewController {
        let infoViewController = viewControllersFactory.createInfoViewController()
        let tabBarItem = UITabBarItem(title: L10n.Tabbar.Name.info, image: UIImage(systemName: "info.circle"), selectedImage: nil)
        infoViewController.tabBarItem = tabBarItem
        return infoViewController
    }

    private func createQuotesListViewController() -> UIViewController {
        let quotesListViewController = viewControllersFactory.createQuotesListViewController(actions: quotesListActions)
        let navigationController = UINavigationController(rootViewController: quotesListViewController)
        let tabBarItem = UITabBarItem(title: L10n.Tabbar.Name.list, image: UIImage(systemName: "list.dash"), selectedImage: nil)
        quotesListNavigationController = navigationController
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }

    private func createQuoteOfTheDayViewController() -> UIViewController {
        let viewController = viewControllersFactory.createQuoteOfTheDayViewController()
        let tabBarItem = UITabBarItem(title: L10n.Tabbar.Name.random, image: UIImage(systemName: "shuffle"), selectedImage: nil)
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
