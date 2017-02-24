import Foundation
import UIKit

final class EFImageLoader : UIView {
    
    private static let screenSize: CGRect = UIScreen.main.bounds
    private static let statusSize = UIApplication.shared.statusBarFrame.height
    
    static let shared = EFImageLoader()
    
    var imageView:UIImageView
    var baseView:UIView
    var viewBackground:UIView
    var loadingImages = (0...29).map { UIImage(named: "loading_000\($0)")! }
    let screenSize: CGRect = UIScreen.main.bounds
    
    var animationDuration:TimeInterval
    
    
    init(view: UIView, imagesFrames:[UIImage], backgroundAlpha:CGFloat = 0.2, animationDuration:TimeInterval) {
        
        if imagesFrames == nil {
            fatalError("you need to pass an array of images")
        }
        
        self.animationDuration = animationDuration
        
        self.viewBackground = UIView(frame: CGRect(x: 0, y: -EFImageLoader.statusSize, width: EFImageLoader.screenSize.width, height: EFImageLoader.screenSize.height + EFImageLoader.statusSize))
        
        self.baseView = UIView(frame: CGRect(x: EFImageLoader.screenSize.width/4, y: EFImageLoader.screenSize.height/4, width: EFImageLoader.screenSize.width/4, height: EFImageLoader.screenSize.height/4))
        
        self.imageView = UIImageView(frame: CGRect(x: (baseView.frame.width) - 40, y: (baseView.frame.height) - 40, width: 80, height: 80))
        
        
        self.loadingImages = imagesFrames
        self.viewBackground.backgroundColor = UIColor.darkGray
        self.viewBackground.alpha = backgroundAlpha
        
        self.imageView.animationImages = loadingImages
        self.imageView.animationDuration = self.animationDuration
        
        self.baseView.addSubview(imageView)
        super.init(frame: UIScreen.main.bounds)
        
        self.addSubview(viewBackground)
        self.addSubview(baseView)
    }
    
    
    convenience init() {
        self.init(view:UIView(), imagesFrames:[], backgroundAlpha:0.2, animationDuration:0.9)
    }
    
    required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation(uiView: UIView) {
        self.stopAnimating(uiView: uiView)
        self.isUserInteractionEnabled = false
        print(self.loadingImages.count)
        if self.loadingImages != nil {
            baseView.addSubview(imageView)
            self.addSubview(viewBackground)
            self.addSubview(baseView)
            imageView.startAnimating()
        }
    }
    
    //    func startAnimation(uiView: UIView) {
    //        self.stopAnimating(uiView: uiView)
    //        self.isUserInteractionEnabled = false
    //
    //        viewBackground = UIView(frame: CGRect(x: 0, y: -20, width: screenSize.width, height: screenSize.height + 20))
    //
    //        //viewBackground?.backgroundColor = UIColor.black
    //        viewBackground?.backgroundColor = UIColor.white
    //        viewBackground?.alpha = 0.2
    //
    //        baseView = UIView(frame: CGRect(x: screenSize.width/4, y: screenSize.height/4, width: screenSize.width/4, height: screenSize.height/4))
    //
    //        imageView = UIImageView(frame: CGRect(x: (baseView?.frame.width)! - 40, y: (baseView?.frame.height)! - 40, width: 80, height: 80))
    //
    //        imageView?.animationImages = loadingImages
    //        imageView?.animationDuration = 0.9
    //        baseView?.addSubview(imageView!)
    //
    //        uiView.addSubview(viewBackground!)
    //        uiView.addSubview(baseView!)
    //
    //        imageView?.startAnimating()
    //
    //    }
    
    func stopAnimating(uiView: UIView) {
        self.imageView.stopAnimating()
        self.imageView.removeFromSuperview()
        self.baseView.removeFromSuperview()
        self.viewBackground.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }
}

// class EFImageLoader : UIView {
//
//    private static let screenSize: CGRect = UIScreen.main.bounds
//    private static let statusSize = UIApplication.shared.statusBarFrame.height
//
//    //MARK: Shared Instance
//
//     static let shared : EFImageLoader = {
//        let instance = EFImageLoader()
//        return instance
//    }()
//
//    //MARK: Local Variable
//
//    var imageView:UIImageView
//    var baseView:UIView
//    var viewBackground:UIView
//    var rootView:UIView
//
//     var loadingImages:[UIImage] = []
//
//     var animationDuration:TimeInterval
//
//    //MARK: Init
//
//     convenience init() {
//        self.init(view:UIView(), imagesFrames:[], backgroundAlpha:0.2, animationDuration:0.9)
//    }
//
//    required  init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    //MARK: Init Properties
//
//     init(view: UIView, imagesFrames:[UIImage], backgroundAlpha:CGFloat = 0.2, animationDuration:TimeInterval) {
//
//        if imagesFrames == nil {
//            fatalError("you need to pass an array of images")
//        }
//
//        self.rootView = view
//        self.animationDuration = animationDuration
//
//        self.viewBackground = UIView(frame: CGRect(x: 0, y: -EFImageLoader.statusSize, width: EFImageLoader.screenSize.width, height: EFImageLoader.screenSize.height + EFImageLoader.statusSize))
//
//        self.baseView = UIView(frame: CGRect(x: EFImageLoader.screenSize.width/4, y: EFImageLoader.screenSize.height/4, width: EFImageLoader.screenSize.width/4, height: EFImageLoader.screenSize.height/4))
//
//        self.imageView = UIImageView(frame: CGRect(x: (baseView.frame.width) - 40, y: (baseView.frame.height) - 40, width: 80, height: 80))
//
//
//        self.loadingImages = imagesFrames
//        self.viewBackground.backgroundColor = UIColor.darkGray
//        self.viewBackground.alpha = backgroundAlpha
//
//        self.imageView.animationImages = loadingImages
//        self.imageView.animationDuration = self.animationDuration
//
//        self.baseView.addSubview(imageView)
//        rootView.addSubview(viewBackground)
//        rootView.addSubview(baseView)
//
//        super.init(frame: UIScreen.main.bounds)
//    }
//
//    func setup(view: UIView?, imagesFrames:[UIImage], backgroundAlpha:CGFloat = 0.2, animationDuration:TimeInterval) {
//
//        self.animationDuration = animationDuration
//
//        self.viewBackground = UIView(frame: CGRect(x: 0, y: -EFImageLoader.statusSize, width: EFImageLoader.screenSize.width, height: EFImageLoader.screenSize.height + EFImageLoader.statusSize))
//
//        self.baseView = UIView(frame: CGRect(x: EFImageLoader.screenSize.width/4, y: EFImageLoader.screenSize.height/4, width: EFImageLoader.screenSize.width/4, height: EFImageLoader.screenSize.height/4))
//
//        self.imageView = UIImageView(frame: CGRect(x: (baseView.frame.width) - 40, y: (baseView.frame.height) - 40, width: 80, height: 80))
//
//
//        self.loadingImages = imagesFrames
//        self.viewBackground.backgroundColor = UIColor.darkGray
//        self.viewBackground.alpha = backgroundAlpha
//
//        self.imageView.animationImages = loadingImages
//        self.imageView.animationDuration = self.animationDuration
//        self.baseView.addSubview(imageView)
//
//        view?.addSubview(viewBackground)
//        view?.addSubview(baseView)
//    }
//
//     func startAnimation() {
//        self.stopAnimating()
//        self.isUserInteractionEnabled = false
//        print(self.loadingImages.count)
//        if self.loadingImages != nil {
//            baseView.addSubview(imageView)
//            rootView.addSubview(viewBackground)
//            rootView.addSubview(baseView)
//            imageView.startAnimating()
//        }
//    }
//
//     func stopAnimating() {
//        self.imageView.stopAnimating()
//        self.imageView.removeFromSuperview()
//        self.baseView.removeFromSuperview()
//        self.viewBackground.removeFromSuperview()
//        self.isUserInteractionEnabled = true
//    }
//}
