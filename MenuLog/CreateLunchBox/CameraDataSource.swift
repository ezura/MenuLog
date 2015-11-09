//
//  CameraDataSource.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/05.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class CameraDataSource:ImageDataSource {
    /**
    画像をカメラで取ってくる
    */
    override func captureLunchBoxImage(rootViewController: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            var imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.allowsEditing = true
            
            rootViewController.presentViewController(imagePicker, animated: false, completion: nil)
        }
        else
        {
            // TODO: カメラ使えないアラート
            if let didCancel = onDidCancel {
                didCancel()
            }
        }
    }

}
