//
//  WidViewController.swift
//  SlideshowApp
//
//  Created by 黒田智子 on 2021/02/05.
//

import UIKit

class WidViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!
    
    var image2: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imageView2.image = image2
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


