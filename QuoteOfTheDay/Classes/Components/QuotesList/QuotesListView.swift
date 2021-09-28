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
            Divider()
            List {
                ForEach(viewModel.quotes) { quote in
                    Button(action: {
                        interactor.selected(quote: quote)
                    }, label: {
                        switch viewModel.presentationType {
                            case .author:
                                Text(quote.author)
                            case .quote:
                                Text(quote.text).lineLimit(1)
                        }
                    }).listRowBackground(Color.bookBackground)
                }
            }
        }.background(Color.bookBackground)

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
                    Text(option.name)
                })
            }
        } label: {
            HStack {
                Text(L10n.QuotesList.Settings.viewType)
                Text(viewModel.presentationType.name)
            }
            .foregroundColor(.black)
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
                Text(L10n.QuotesList.Settings.categoryType)
                Text(viewModel.selectedCategory ?? L10n.QuotesList.Settings.Category.none)
            }
            .foregroundColor(.black)
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
