# EFImageLoader

[![CI Status](http://img.shields.io/travis/ezefranca/EFImageLoader.svg?style=flat)](https://travis-ci.org/ezefranca/EFImageLoader)
[![Version](https://img.shields.io/cocoapods/v/EFImageLoader.svg?style=flat)](http://cocoapods.org/pods/EFImageLoader)
[![License](https://img.shields.io/cocoapods/l/EFImageLoader.svg?style=flat)](http://cocoapods.org/pods/EFImageLoader)
[![Platform](https://img.shields.io/cocoapods/p/EFImageLoader.svg?style=flat)](http://cocoapods.org/pods/EFImageLoader)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EFImageLoader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EFImageLoader"
```

## Usage example

To start loader you just need add the ```EFImageLoaderProtocol``` protocol and start loader with ```showImageLoader(options)``` passing in options one ```EFImageLoaderOptions``` object.

To stop loader, use ```hideImageLoader()```.

```swift

import UIKit
import EFImageLoader

class ViewController: UIViewController, EFImageLoaderProtocol {
    
    let images : [UIImage] = [#imageLiteral(resourceName: "number1"), #imageLiteral(resourceName: "number2"), #imageLiteral(resourceName: "number3"), #imageLiteral(resourceName: "number4"), #imageLiteral(resourceName: "number5"), #imageLiteral(resourceName: "number6"), #imageLiteral(resourceName: "number7"), #imageLiteral(resourceName: "number8"), #imageLiteral(resourceName: "number9"), #imageLiteral(resourceName: "number10")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func stopLoader(_ sender: Any) {
        self.hideImageLoader()
    }
    
    @IBAction func showNumbers(_ sender:Any) {
        
        let options = EFImageLoaderOptions(imagesFrames: images, backgroundAlpha: 0.5, backgroundFadeColor:UIColor.green, animationDuration: 2.0)
        self.showImageLoader(options)
        
    }
}

```

## Author

ezefranca, ezequiel.ifsp@gmail.com

## License

EFImageLoader is available under the MIT license. See the LICENSE file for more info.
