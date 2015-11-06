//
//  PhotoLibraryDataSource.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/05.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class PhotoLibraryDataSource: ImageDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func captureLunchBoxImage(rootViewController: UIViewController) {
        var imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = true
        imagePicker.navigationItem.setHidesBackButton(true, animated: true)
        
        rootViewController.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
}
