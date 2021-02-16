//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 黒田智子 on 2021/02/05.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = UIImage(named: "okashi1.jpg")
        imageView.image = image1
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier:"result", sender: nil)
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var onNextButton: UIButton!
    
    @IBOutlet weak var onPrevButton: UIButton!
    
    @IBOutlet weak var goandstop: UIButton!
    
    var timer: Timer!
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    
    // 画像の名前の配列
    let imageNameArray = [
        "okashi1.jpg",
        "okashi2.jpg",
        "okashi3.jpg",
    ]
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        dispImageNo += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (dispImageNo == imageNameArray.count) {
            // indexを一番最初の数字に戻す
            dispImageNo = 0
        }
        // 画像表示
        displayImage()
    }
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    @IBAction func onPrev(_ sender: UIButton) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        if ( dispImageNo > 2 ) {
            dispImageNo = 0 // 3になったら0に戻す
        } else if (dispImageNo < 0){
            dispImageNo = 2
        }
        print(dispImageNo)
        // 画像表示
        displayImage()
        
        
    }
    
    @IBAction func onNext(_ sender: UIButton) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        if ( dispImageNo > 2 ) {
            dispImageNo = 0 // 3になったら0に戻す
        } else if (dispImageNo < 0){
            dispImageNo = 2
        }
        print(dispImageNo)
        // 画像表示
        displayImage()
        
    }
    
    
    @IBAction func goandstop(_ sender: UIButton) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval:  2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            sender.setTitle("停止", for: .normal)
            
            // 再生中はボタンを無効にする
            onNextButton.isEnabled = false
            onPrevButton.isEnabled = false
            
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく
            timer = nil
            
            // 画像表示
            displayImage()
            
            sender.setTitle("再生", for: .normal)
            
            // 停止中はボタンを有効にする
            onNextButton.isEnabled = true
            onPrevButton.isEnabled = true
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        
        let ViewController:WidViewController = segue.destination as! WidViewController
        
        //遷移先のWidtViewControllerで宣言しているimage2に画像を渡す
        
        ViewController.image2 = imageView.image
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
}







