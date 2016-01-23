# CocoaPath

[![CI Status](http://img.shields.io/travis/Андрей Лазарев/CocoaPath.svg?style=flat)](https://travis-ci.org/Андрей Лазарев/CocoaPath)
[![Version](https://img.shields.io/cocoapods/v/CocoaPath.svg?style=flat)](http://cocoapods.org/pods/CocoaPath)
[![License](https://img.shields.io/cocoapods/l/CocoaPath.svg?style=flat)](http://cocoapods.org/pods/CocoaPath)
[![Platform](https://img.shields.io/cocoapods/p/CocoaPath.svg?style=flat)](http://cocoapods.org/pods/CocoaPath)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```obj-c
    id object = @{@"A": @{@"A": @1},
                  @"B": @2,
                  @"C": @[@1, @[@YES], @{@"D": @3}]};
    
	// @1
    [object firstForKeyWildcard:@"C[0]"];
	// @3
	[object firstForKeyWildcard:@"C[2].D"]).to.equal(@3);
```
	

## Installation

CocoaPath is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CocoaPath"
```

## Author

Андрей Лазарев, andrej.lazarev@gmail.com

## License

CocoaPath is available under the MIT license. See the LICENSE file for more info.
