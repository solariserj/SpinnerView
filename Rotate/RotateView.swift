//
//  RotateView.swift
//  RotateButton
//
//  Created by SolariSerj on 8/15/19.
//  Copyright © 2019 Attribute. All rights reserved.
//

import Foundation
import UIKit

class RotateView: UIView {

    var duration: Double = 1.5

    var radius: CGFloat = 25

    var zeroAngle = CGFloat.pi/3

    var imagesSize = CGSize(width: 20, height: 20)

    var arrowSize = CGSize(width: 50, height: 50)

    var image1 = UIImage(named: "LiteraA")

    var image2 = UIImage(named: "LiteraA")

    var arrowImage = UIImage(named: "TranslateCircle")

    var isRotate = false
    
    var canRotate = false
 
    private var imageView1 = UIImageView()
    private var imageView2 = UIImageView()
    private var arrowView = UIImageView()

    private var orbitOne = CAKeyframeAnimation()
    private var orbitTwo = CAKeyframeAnimation()
    private var arrowAnimation = CAKeyframeAnimation()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    func initElements() {

        arrowView = UIImageView(frame: CGRect(origin: .zero, size: arrowSize))
        arrowView.backgroundColor = .clear
        arrowView.image = arrowImage
        arrowView.contentMode = .scaleAspectFit
        self.addSubview(arrowView)

        imageView1 = UIImageView(frame: CGRect(origin: .zero, size: imagesSize))
        imageView1.backgroundColor = .clear
        imageView1.image = image1
        imageView1.contentMode = .scaleAspectFit
        self.addSubview(imageView1)
        imageView1.center = .zero

        imageView2 = UIImageView(frame: CGRect(origin: .zero, size: imagesSize))
        imageView2.backgroundColor = .clear
        imageView2.image = image2
        imageView2.contentMode = .scaleAspectFit
        self.addSubview(imageView2)

        initAnimation()
    }

    func initAnimation() {

        let centerC = CGPoint(x: self.bounds.width/2.0, y:self.bounds.height/2.0)

//        var affineTransform = CGAffineTransform(rotationAngle: zeroAngle)
//        affineTransform = affineTransform.rotated(by: CGFloat.pi/6)
//        image1.transform = affineTransform
        imageView1.center = CGPoint(x: centerC.x + radius*cos(zeroAngle), y: centerC.y - radius*sin(zeroAngle))

        orbitOne = CAKeyframeAnimation(keyPath: "position")
        let circlePath = UIBezierPath(arcCenter: centerC, radius: radius, startAngle: -zeroAngle, endAngle:2*CGFloat.pi - zeroAngle, clockwise: true)
        orbitOne.path = circlePath.cgPath
        orbitOne.duration = duration
        //        orbit.isAdditive = true
        orbitOne.repeatCount = 1
        orbitOne.calculationMode = CAAnimationCalculationMode.paced
        //        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        orbitOne.delegate = self

        imageView2.center = CGPoint(x: centerC.x + radius*cos(CGFloat.pi+zeroAngle), y: centerC.y + radius*sin(CGFloat.pi-zeroAngle))

        orbitTwo = CAKeyframeAnimation(keyPath: "position")
        let circlePathTwo = UIBezierPath(arcCenter: centerC, radius: radius, startAngle: CGFloat.pi-zeroAngle, endAngle: 3*CGFloat.pi-zeroAngle, clockwise: true)
        orbitTwo.path = circlePathTwo.cgPath
        orbitTwo.duration = duration
        //        orbit.isAdditive = true
        orbitTwo.repeatCount = 1
        orbitTwo.calculationMode = CAAnimationCalculationMode.paced
        //        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
//        orbitTwo.delegate = self

        arrowView.center = centerC

        arrowAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        arrowAnimation.values = [NSNumber(value: Float(0)), 2*CGFloat.pi]
        arrowAnimation.duration = duration
    //        orbit.isAdditive = true
        arrowAnimation.repeatCount = 1
        arrowAnimation.calculationMode = CAAnimationCalculationMode.linear
        arrowAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear)]

//        anim.duration = max(strength / 2, 1.0)
//        anim.isCumulative = true
//        anim.values = [NSNumber(value: Float(p)), Float(circleRotationOffset)]
//        anim.keyTimes = [NSNumber(value: Float(0)),NSNumber(value: Float(1.0))]
//        anim.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
//        anim.isRemovedOnCompletion = false
//        anim.fillMode = kCAFillModeForwards
//        anim.delegate = self
//        wheelImage.layer.removeAllAnimations()
//        wheelImage.layer.add(anim, forKey: "rotate")

    }

    func startRotate() {

        imageView1.layer.add(orbitOne, forKey: "orbitOne")
        imageView2.layer.add(orbitTwo, forKey: "orbitTwo")
        arrowView.layer.add(arrowAnimation, forKey: "arrowAnimation")

        isRotate = true
    }

    func stopRotate() {
        canRotate = false
    }

    func startStopAnimation() {
        if isRotate == false {
            startRotate()
            canRotate = true
        } else {
            stopRotate()
        }
    }


}

extension RotateView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if canRotate == true {
            startRotate()
        } else {
            isRotate = false
        }
    }

}

