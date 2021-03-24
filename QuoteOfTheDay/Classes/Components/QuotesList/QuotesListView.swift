//
//  QuotesListView.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 23/03/2021.
//

import SwiftUI
import Combine


struct QuotesListView: View {
    @ObservedObject var viewModel: QuotesListViewModel
    let interactor: QuotesListInteractor

    var body: some View {
        VStack {
            SettingsView(viewModel: viewModel, interactor: interactor)
            List(viewModel.quotes) { quote in
                Button(action: {
                    interactor.selected(quote: quote)
                }, label: {
                    switch viewModel.presentationType {
                        case .author:
                            Text(quote.author)
                        case .quote:
                            Text(quote.text).lineLimit(1)
                    }
                })
            }
        }
    }
}

struct SettingsView: View {
    @ObservedObject var viewModel: QuotesListViewModel
    let interactor: QuotesListInteractor

    var body: some View {
        HStack {
            presentationTypeSelector().padding()
            Spacer()
            categorySelector().padding()
        }
    }

    @ViewBuilder
    private func presentationTypeSelector() -> some View {
        Menu {
            ForEach(viewModel.presentationOptions, id: \.self) { option in
                Button(action: {
                    interactor.selected(presentationOption: option)
                }, label: {
                    Text(option.rawValue)
                })
            }
        } label: {
            HStack {
                Text("Widok: ")
                Text(viewModel.presentationType.rawValue)
            }
        }
    }

    @ViewBuilder
    private func categorySelector() -> some View {
        Menu {
            ForEach(viewModel.categories, id: \.self) { category in
                Button(action: {
                    interactor.selected(category: category)
                }, label: {
                    Text(category)
                    if category == viewModel.selectedCategory {
                        Image(systemName: "checkmark")
                    }
                })
            }
        } label: {
            HStack {
                Text("Kategoria: ")
                Text(viewModel.selectedCategory ?? "-brak-")
            }
        }
    }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView(viewModel: QuotesListViewModel(), interactor: QuotesListInteractorStub())
    }
}

final class QuotesListInteractorStub: QuotesListInteractor {
    func selected(category: QuoteCategory) { }
    func selected(quote: Quote) { }
    func selected(presentationOption: PresentationOption) { }
}
