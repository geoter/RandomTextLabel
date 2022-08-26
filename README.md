# RandomTextLabel
> Layout test UILabel

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

This library helps you easily stress test your layout constraints, by assigning random long strings to UILabels.
The type of content is respected, to help readability of the UI. (A number is replaced with a big number)

For detailed explanation see https://medium.com/@george.termentzoglou/ios-layouttest-with-method-swizzling-d56da55ef68a

## Installation

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/geoter/RandomTextLabel.git", majorVersion: 0, minor: 0)
    ]
)
```

## Usage example


```swift
import RandomTextLabel
UILabel.randomText() //now all labels get a random text when .text = .. is called
```



## Meta

George Termentzoglou – [Medium](https://medium.com/@george.termentzoglou) – georgeterme@gmail.com

Distributed under the MIT license.

[https://github.com/geoter](https://github.com/geoter)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
