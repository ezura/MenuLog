//
//  lunchBoxImageDataSource.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/05.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

enum ImageDataSourceType: Int {
    case ImageDataSourceTypeCamera, ImageDataSourceTypePhotoLibrary
}

class ImageDataSource: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var onDidFinishPickingImage: ((UIImage) -> Void)?
    var onDidCancel: (() -> Void)?
    
    class func createByType(type: ImageDataSourceType) -> ImageDataSource
    {
        switch type {
        case .ImageDataSourceTypeCamera:
            return CameraDataSource()
        case .ImageDataSourceTypePhotoLibrary:
            return PhotoLibraryDataSource()
        }
    }
    
    /**
    画像データを取得する画面を表示する
    
    - parameter topViewController:     選択画面の親ViewController
    - parameter didFinishPickingImage: 画像を取得した後の処置
    - parameter didCancel:             画像の取得をキャンセルしたときの処理
    */
    func showImagePickerView<RootViewController: UIViewController where RootViewController: UINavigationControllerDelegate>(
        rootViewController: RootViewController,
        didFinishPickingImage: ((UIImage) -> Void),
        didCancel: (() -> Void))
    {
        onDidFinishPickingImage = didFinishPickingImage
        onDidCancel = didCancel
        
        captureLunchBoxImage(rootViewController)
    }
    
    /**
    お弁当の画像をどこかから取ってくる
    (must: override)
    */
    func captureLunchBoxImage(rootViewController: UIViewController) {
    }
    
    //-- MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker:UIImagePickerController)
    {
        if let didCancel = onDidCancel {
            didCancel()
        }
        picker.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        guard let pickedObject = info[UIImagePickerControllerOriginalImage] else {
            // TODO: エラーハンドリング
            picker.dismissViewControllerAnimated(true, completion: nil);
            return
        }
        
        if let didFinishPickingImage = onDidFinishPickingImage {
            let pickedImage = pickedObject as! UIImage
            didFinishPickingImage(pickedImage)
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil);
    }
}
