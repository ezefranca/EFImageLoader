import Foundation
import UIKit

public class EFImageLoader : UIView {
    
    private static let screenSize: CGRect = UIScreen.main.bounds
    private static let statusSize = UIApplication.shared.statusBarFrame.height
    
    //MARK: Shared Instance
    
    public static let shared : EFImageLoader = {
        let instance = EFImageLoader()
        return instance
    }()
    
    //MARK: Local Variable
    
    var imageView:UIImageView
    var baseView:UIView
    var viewBackground:UIView
    var rootView:UIView
    
    public var loadingImages:[UIImage] = []
    
    public var animationDuration:TimeInterval
    
    //MARK: Init
    
    public convenience init() {
        self.init(view:UIView(), imagesFrames:[], backgroundAlpha:0.2, animationDuration:0.9)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Init Properties
    
    public init(view: UIView, imagesFrames:[UIImage], backgroundAlpha:CGFloat = 0.2, animationDuration:TimeInterval) {
        
        if imagesFrames == nil {
            fatalError("you need to pass an array of images")
        }
        
        self.rootView = view
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
        rootView.addSubview(viewBackground)
        rootView.addSubview(baseView)
        
        super.init(frame: UIScreen.main.bounds)
    }
    
    func setup(view: UIView?, imagesFrames:[UIImage], backgroundAlpha:CGFloat = 0.2, animationDuration:TimeInterval) {
        
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
        
        view?.addSubview(viewBackground)
        view?.addSubview(baseView)
    }

    public func startAnimation() {
        self.stopAnimating()
        self.isUserInteractionEnabled = false
        print(self.loadingImages.count)
        if self.loadingImages != nil {
            baseView.addSubview(imageView)
            rootView.addSubview(viewBackground)
            rootView.addSubview(baseView)
            imageView.startAnimating()
        }
    }
    
    public func stopAnimating() {
        self.imageView.stopAnimating()
        self.imageView.removeFromSuperview()
        self.baseView.removeFromSuperview()
        self.viewBackground.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }
}
