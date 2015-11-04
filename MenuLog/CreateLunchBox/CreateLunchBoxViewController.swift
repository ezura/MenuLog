//
//  CreateLunchBoxViewController.swift
//  MenuLog
//
//  Created by yuka ezura on 2015/11/04.
//  Copyright © 2015年 ezura yuka. All rights reserved.
//

import UIKit

class CreateLunchBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    お弁当の画像をどこかから取ってくる
    - returns: お弁当画像
    */
    private func getLunchBoxImage() -> UIImage? {
        return nil
    }
    
    /**
    とってきたお弁当の画像を表示する
    - parameter lunchBoxImage: とってきたお弁当の画像
    */
    private func previewLunchBoxImage(lunchBoxImage: UIImage) {
        // TODO: 画像表示
    }
    
    private func saveLunchBoxImage() {
        // TODO: 保存
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
