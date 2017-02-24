//
//  ViewController.swift
//  EFImageLoader
//
//  Created by ezefranca on 02/21/2017.
//  Copyright (c) 2017 ezefranca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoaderProtocol {

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
        
//        loader?.loadingImages = (0...29).map { UIImage(named: "loading_000\($0)")! }
//        loader?.startAnimation()
//        self.stopLoader()
    }
    
    @IBAction func showMario(_ sender: Any) {
        let options = LoaderOptions(imagesFrames: (1...10).map { UIImage(named: "number\($0)")!}, backgroundAlpha: 0.2, animationDuration: 0.9)
    }
}

