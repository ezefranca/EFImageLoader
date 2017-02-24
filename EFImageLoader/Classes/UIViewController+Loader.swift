import Foundation
import UIKit

public protocol LoaderProtocol {
    func showImageLoader(_ options:LoaderOptions)
    func showImageLoader()
    func hideImageLoader()
}

public struct LoaderOptions {
    
    var imagesFrames:[UIImage]
    var backgroundAlpha:CGFloat
    var animationDuration:TimeInterval
    
    public init(imagesFrames:[UIImage], backgroundAlpha:CGFloat, animationDuration:TimeInterval) {
        self.imagesFrames = imagesFrames
        self.backgroundAlpha = backgroundAlpha
        self.animationDuration = animationDuration
    }
    
}

extension UIViewController : LoaderProtocol {
    
    public func showImageLoader(_ options: LoaderOptions) {
        EFImageLoader(view: view, imagesFrames: options.imagesFrames, backgroundAlpha: options.backgroundAlpha, animationDuration: options.animationDuration)
        EFImageLoader.shared.startAnimation(uiView: view)
    }
    
    public func showImageLoader() {
        EFImageLoader.shared.startAnimation(uiView: view)
    }
    
    public func hideImageLoader() {
        EFImageLoader.shared.stopAnimating(uiView: view)
    }
    
}
