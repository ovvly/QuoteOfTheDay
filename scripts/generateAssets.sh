#!/bin/bash

cd ../
swiftgen run xcassets -t swift5 "QuoteOfTheDay/Resources/Assets.xcassets" --output "QuoteOfTheDay/Resources/Assets.swift"
