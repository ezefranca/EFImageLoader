//
//  ViewController.swift
//  EFImageLoader
//
//  Created by ezefranca on 02/21/2017.
//  Copyright (c) 2017 ezefranca. All rights reserved.
//

import UIKit
import EFImageLoader

class ViewController: UIViewController {
    
    var loader:EFImageLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loader = EFImageLoader(view: self.view, imagesFrames: [], animationDuration: 0.9)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showLoader(_ sender: Any) {
        loader?.loadingImages = (0...29).map { UIImage(named: "loading_000\($0)")! }
        loader?.startAnimation()
        self.stopLoader()
    }
    
    @IBAction func showMario(_ sender: Any) {
        
        EFImageLoader(view: self.view, imagesFrames: (1...17).map { UIImage(named: "mario\($0)")! } , backgroundAlpha: 0.2, animationDuration: 2)
            
            .startAnimation()
        
        self.stopLoader()
    }
    
    func stopLoader() {
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.loader?.stopAnimating()
        }
        
    }
    
}

