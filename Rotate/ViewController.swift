//
//  ViewController.swift
//  RotateButton
//
//  Created by SolariSerj on 8/15/19.
//  Copyright © 2019 Attribute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var actionBtn: UIButton!
    
    @IBOutlet weak var rotateView: RotateView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        rotateView.layer.borderWidth = 1
        rotateView.layer.borderColor = UIColor.black.cgColor
        rotateView.layer.cornerRadius = rotateView.bounds.size.width / 2.0
        rotateView.layer.masksToBounds = true
        
        rotateView.arrowSize = CGSize(width: 30, height: 30)
        rotateView.imagesSize = CGSize(width: 15, height: 15)
        rotateView.radius = 15
        rotateView.image1 = UIImage(named: "LiteraA")
        rotateView.image2 = UIImage(named: "LiteraA")

        rotateView.initElements()

        setButtonState()

    }

    @IBAction func rotateAct() {
        rotateView.startStopAnimation()
        setButtonState()
    }

    func setButtonState() {
        let title = (rotateView.canRotate) ? "Stop Rotate" : "Start Rotate"
        actionBtn.setTitle(title, for: .normal)
    }
    
    
}

