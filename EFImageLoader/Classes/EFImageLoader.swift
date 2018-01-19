import Foundation
import UIKit

public protocol EFImageLoaderProtocol : class {
    func showImageLoader(_ options:EFImageLoaderOptions)
    func showImageLoader()
    func hideImageLoader()
}

public struct EFImageLoaderOptions {
    
    var imagesFrames:[UIImage]
    var backgroundAlpha:CGFloat
    var animationDuration:TimeInterval
    var backgroundFadeColor:UIColor
    
    public init(imagesFrames:[UIImage], backgroundAlpha:CGFloat, backgroundFadeColor:UIColor, animationDuration:TimeInterval) {
        self.imagesFrames = imagesFrames
        self.backgroundAlpha = backgroundAlpha
        self.backgroundFadeColor = backgroundFadeColor
        self.animationDuration = animationDuration
    }
}

extension EFImageLoaderProtocol where Self: UIViewController {
    
    public func showImageLoader(_ options: EFImageLoaderOptions) {
        _ = EFImageLoader(view, options: options)
        EFImageLoader.shared.startAnimation(uiView: view)
    }
    
    public func showImageLoader() {
        EFImageLoader.shared.startAnimation(uiView: view)
    }
    
    public func hideImageLoader() {
        EFImageLoader.shared.stopAnimating(uiView: view)
    }
}

var _shared:EFImageLoader!

public class EFImageLoader : UIView {
    
    private static let screenSize: CGRect = UIScreen.main.bounds
    private static let statusSize = UIApplication.shared.statusBarFrame.height
    
    
    var imageView:UIImageView
    var baseView:UIView
    var viewBackground:UIView
    var loadingImages:[UIImage]
    let screenSize: CGRect = UIScreen.main.bounds
    
    var animationDuration:TimeInterval
    var backgroundAlpha: CGFloat
    var backgroundFadeColor: UIColor?
    
    class var shared : EFImageLoader! {
        if _shared == nil {
            print("error: shared called before setup")
            return nil
        }
        return _shared
    }
    
    init(_ view: UIView, options: EFImageLoaderOptions) {
        
        if (options.imagesFrames.indices.Notcontains(0)) {
            fatalError("you need to pass an array of images")
        }
        
        self.animationDuration = options.animationDuration
        self.backgroundAlpha = options.backgroundAlpha
        self.backgroundFadeColor = options.backgroundFadeColor
        
        self.viewBackground = UIView(frame: CGRect(x: 0, y: -EFImageLoader.statusSize, width: EFImageLoader.screenSize.width, height: EFImageLoader.screenSize.height + EFImageLoader.statusSize))
        
        self.baseView = UIView(frame: CGRect(x: EFImageLoader.screenSize.width/4, y: EFImageLoader.screenSize.height/4, width: EFImageLoader.screenSize.width/4, height: EFImageLoader.screenSize.height/4))
        
        
        self.imageView = UIImageView(frame: CGRect(x: (baseView.frame.width) - 40, y: (baseView.frame.height) - 40, width: 80, height: 80))
        
        
        self.loadingImages = options.imagesFrames
        self.viewBackground.backgroundColor = UIColor.black
        self.viewBackground.alpha = backgroundAlpha
        
        self.imageView.animationImages = loadingImages
        self.imageView.animationDuration = self.animationDuration
        
        self.baseView.addSubview(imageView)
        super.init(frame: UIScreen.main.bounds)
        
        self.addSubview(viewBackground)
        self.addSubview(baseView)
        _shared = self
    }
    
    
    convenience init() {
        self.init(UIView(), options: EFImageLoaderOptions(imagesFrames:[], backgroundAlpha:0.2, backgroundFadeColor:UIColor.darkGray ,animationDuration:0.9))
    }
    
    required  public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation(uiView: UIView) {
        self.stopAnimating(uiView: uiView)
        self.isUserInteractionEnabled = false
        viewBackground.alpha = self.backgroundAlpha
        viewBackground.backgroundColor = self.backgroundFadeColor
        imageView.animationImages = self.loadingImages
        imageView.animationDuration = self.animationDuration
        baseView.addSubview(imageView)
        uiView.addSubview(viewBackground)
        uiView.addSubview(baseView)
        imageView.startAnimating()
    }
    
    func stopAnimating(uiView: UIView) {
        self.imageView.stopAnimating()
        self.imageView.removeFromSuperview()
        self.baseView.removeFromSuperview()
        self.viewBackground.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }
}

fileprivate extension CountableRange {
    func Notcontains(_ element: Bound) -> Bool {
        return !(self.contains(element))
    }
}

