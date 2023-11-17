//
//  ViewController.swift
//  SMUIK_6
//
//  Created by Andrei Kovryzhenko on 17.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSquareView()
        makeTapGesture()
    }
    
    private func setUpSquareView() {
        squareView = UIView(frame: CGRect(
            x: 200,
            y: 200,
            width: 80,
            height: 80
        ))
        squareView.layer.cornerRadius = 12
        squareView.backgroundColor = .systemBlue
        view.addSubview(squareView)
    }
    
    private func makeTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapOnScreen(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        let modifierAngle = sqrt(min(tapPoint.x, tapPoint.y))
       
        let animator = UIViewPropertyAnimator(duration: 1.2, dampingRatio: 0.65) {
            self.squareView.center = tapPoint
            self.squareView.transform = CGAffineTransform(rotationAngle: .pi/modifierAngle)
        }
        animator.addAnimations({
            self.squareView.transform = .identity
        }, delayFactor: 0.2)
        
        animator.startAnimation()
    }
}

