//
//  ViewController.swift
//  tryLottie
//
//  Created by Vadim Samoilov on 27.08.22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    
    var button = UIButton()
    var animationView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    @objc func setupAnimation() {
        animationView.animation = Animation.named("dollarDonation")
        animationView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        animationView.center = CGPoint(x: button.center.x, y: button.center.y - 40)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
        view.addSubview(animationView)
    }

    @objc func setupButton() {
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        button.layer.cornerRadius = 20
        button.backgroundColor = .gray
        button.layer.shadowColor = #colorLiteral(red: 0.1279292107, green: 0.1389420331, blue: 0.1537905335, alpha: 1)
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 1.0
        button.layer.masksToBounds = false
        button.setTitle("Buy", for: .normal)
        view.addSubview(button)
    }

    @objc func action() {
        button.layer.shadowOpacity = 0
        Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(setupAnimation), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(setupButton), userInfo: nil, repeats: false)
        animationView.removeFromSuperview()
    }

}

