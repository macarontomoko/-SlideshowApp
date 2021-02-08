//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 黒田智子 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    // outletの接続
    
    @IBOutlet weak var imageView: UIImageView!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // スライドショーさせる画像の読み込み
        let image1: UIImage!
        let image2: UIImage!
        let image3: UIImage!
        
         //  Image Viewに画像を設定
        image1 = UIImage(named: "okashi1")
        image2 = UIImage(named: "okashi2)
        image3 = UIImage(named: "okashi3")
        
    }

    // 再生ボタンを押した時の処理
    @IBAction func goandstart(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            goandstop.setTitle("停止", for: .normal)

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく
            timer = nil

            // ボタンの名前を再生に直しておく
             goandstop.setTitle("再生", for:.normal)
        }
    }

    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
}
    
   
