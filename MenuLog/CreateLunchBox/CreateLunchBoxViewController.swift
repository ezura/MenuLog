//
//  CreateLunchBoxViewController.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/04.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit
import MobileCoreServices

class CreateLunchBoxViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var lunchBoxImagePicker: ImageDataSource?
    @IBOutlet weak var previewImageView: UIImageView!
    
    var imageDataSourceType: ImageDataSourceType = ImageDataSourceType.ImageDataSourceTypePhotoLibrary
    
    private var shouldClose: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lunchBoxImagePicker = ImageDataSource.createByType(imageDataSourceType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (shouldClose) {
            self.close()
            return
        }
        
        // 戻ってきたときも呼ばれてしまうので画像を取得した後は呼ばない
        if (previewImageView.image == nil) {
            if let imagePicker = lunchBoxImagePicker {
                imagePicker.showImagePickerView(self,
                    didFinishPickingImage: { [unowned self]
                        (pickedImage: UIImage) -> Void in
                        self.previewLunchBoxImage(pickedImage)
                    },
                    didCancel: { [unowned self] () -> Void in
                        self.shouldClose = true
                    })
            }
        }
    }
    
    private func close()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
    とってきたお弁当の画像を表示する
    - parameter lunchBoxImage: とってきたお弁当の画像
    */
    private func previewLunchBoxImage(lunchBoxImage: UIImage) {
        // リサイズするなりフィルタかけるなりする
        previewImageView.image = lunchBoxImage
    }
    
    private func saveLunchBoxImage() {
        // TODO: 保存
    }
    
    //-- MARK: ユーザアクション
    @IBAction func saveButtonDidTouch(sender: UIButton) {
        self.saveLunchBoxImage()
    }
    
    @IBAction func cancelButtonDidTouch(sender: UIButton) {
        self.close()
    }

}
