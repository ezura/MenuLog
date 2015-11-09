//
//  ViewController.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/04.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueItentifier = segue.identifier else {
            return
        }
        
        if segueItentifier == "top_createLunchBox_camera" {
            let nextViewController = segue.destinationViewController as! CreateLunchBoxViewController
            nextViewController.imageDataSourceType = .ImageDataSourceTypeCamera
        }
        else if segueItentifier == "top_createLunchBox_photoLibrary" {
            let nextViewController = segue.destinationViewController as! CreateLunchBoxViewController
            nextViewController.imageDataSourceType = .ImageDataSourceTypePhotoLibrary
        }
    }
}

