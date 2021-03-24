//
//  QuoteOfTheDayView.swift
//  QuoteOfTheDay
//
//  Created by Jakub Sowa on 23/03/2021.
//

import SwiftUI

struct QuoteView: View {
    let quote: Quote

    var body: some View {
        VStack {
            Spacer()
            Text(quote.text)
                .font(Font.Charter.roman(size: 18))
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding([.leading, .trailing], 20)
            HStack {
                Spacer()
                Text(quote.author)
                    .font(Font.Charter.bold(size: 20))
                    .foregroundColor(.black)
                    .padding(.trailing, 20)
            }
            Spacer()
        }
        .background(Color.bookBackground)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: Quote(text: "text", author: "author", tags: []))
    }
}
