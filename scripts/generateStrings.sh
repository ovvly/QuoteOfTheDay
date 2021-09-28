#!/bin/bash

cd ../
swiftgen run strings -t structured-swift5 "QuoteOfTheDay/Resources/pl.lproj/Localizable.strings" --output "QuoteOfTheDay/Resources/Localized.swift"
