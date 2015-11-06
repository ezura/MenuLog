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
    
    var shouldClose: Bool = false
    
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
        // 戻ってきたときも呼ばれてしまうので画像を取得した後は呼ばない
        if (!shouldClose && previewImageView.image == nil) {
            if let imagePicker = lunchBoxImagePicker {
                imagePicker.showImagePickerView(self,
                    didFinishPickingImage: { [unowned self]
                        (pickedImage: UIImage) -> Void in
                        self.previewLunchBoxImage(pickedImage)
                    },
                    didCancel: { [unowned self] () -> Void in
                        self.shouldClose = true
                        self.dismissViewControllerAnimated(true, completion: nil)
                    })
            }
        }
    }
    
//    /**
//    お弁当の画像をどこかから取ってくる
//    - returns: お弁当画像
//    */
//    private func captureLunchBoxImage() {
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
//        {
//            cameraUI = UIImagePickerController()
//            cameraUI.delegate = self
////            cameraUI.sourceType = UIImagePickerControllerSourceType.Camera
//            cameraUI.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//            cameraUI.allowsEditing = true
//            
//            self.presentViewController(cameraUI, animated: true, completion: nil)
//        }
//        else
//        {
//            // error msg
//        }
//    }
    
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

//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    
//    //Mark- UIImagePickerController Delegate
//    
//    func imagePickerControllerDidCancel(picker:UIImagePickerController)
//    {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
//    {
//        guard let pickedObject = info[UIImagePickerControllerOriginalImage] else {
//            // TODO: エラーハンドリング
//            return
//        }
//        let pickedImage = pickedObject as! UIImage
//        self.previewLunchBoxImage(pickedImage)
//        picker.dismissViewControllerAnimated(true, completion: nil);
//    }

}
