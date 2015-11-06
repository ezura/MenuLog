//
//  CameraDataSource.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/05.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class CameraDataSource:ImageDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
            imagePicker.navigationItem.setHidesBackButton(true, animated: true)
            
            rootViewController.presentViewController(imagePicker, animated: true, completion: nil)
        }
        else
        {
            // TODO: カメラ使えないアラート
            if let didCancel = onDidCancel {
                didCancel()
                return
            }
        }
    }

}
