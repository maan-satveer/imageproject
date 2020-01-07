//
//  ViewController.swift
//  imageproject
//
//  Created by MacStudent on 2020-01-07.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    var timer = Timer()
    var counter = 0
    var isAnimating = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fadein(_ sender: UIButton) {
        imageview.alpha = 0
        UIView.animate(withDuration: 2){
            self.imageview.alpha = 1
        }
    }
    
    @IBAction func slidein(_ sender: UIButton) {
        imageview.center = CGPoint(x: imageview.center.x - 500, y: imageview.center.y)
        UIView.animate(withDuration: 2){
            self.imageview.center = CGPoint( x: self.imageview.center.x  + 500, y: self.imageview.center.y)
        }
    }
    
    @IBAction func grow(_ sender: UIButton) {
        let width = imageview.frame.size.width
        let height = imageview.frame.size.height
        let x = imageview.frame.origin.x
        let y = imageview.frame.origin.y
        imageview.frame = CGRect(x: x, y: y, width: 0, height: 0)
        UIView.animate(withDuration : 2){
             self.imageview.frame = CGRect(x: x, y: y, width: width, height: height)
        }
        }
    
       
    @IBAction func playin(_ sender: UIButton) {
        if isAnimating{
            timer.invalidate()
             play.setTitle("Play", for: [])
            isAnimating = false
        }
        else{
              timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
            play.setTitle("Stop ", for: [])
            isAnimating = true
            
        }
      
    }
   @objc  func animate(){
    
    imageview.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
    counter += 1
    if counter == 6{
        counter = 0
    }
    }
}
    


