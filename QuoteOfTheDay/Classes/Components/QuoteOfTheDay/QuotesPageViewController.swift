//
//  QuotesPageViewController.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 24/03/2021.
//

import Foundation
import UIKit
import SwiftUI

final class QuotesPageViewController: UIPageViewController {
    private let pageViewControllerBuilder: (Quote) -> UIViewController
    private let quotesProvider: QuotesProvider
    
    init(quotesProvider: QuotesProvider, pageViewControllerBuilder: @escaping (Quote) -> UIViewController) {
        self.quotesProvider = quotesProvider
        self.pageViewControllerBuilder = pageViewControllerBuilder
        
        super.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        guard let firstQuote = quotesProvider.firstQuote() else { return }
        let firstPageViewController = pageViewControllerBuilder(firstQuote)
        setViewControllers([firstPageViewController], direction: .forward, animated: false)
    }
}

extension QuotesPageViewController: UIPageViewControllerDelegate { }

extension QuotesPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let quote = quotesProvider.previousQuote() else { return nil }
        return pageViewControllerBuilder(quote)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let quote = quotesProvider.nextQuote() else { return nil }
        return pageViewControllerBuilder(quote)
    }
}
