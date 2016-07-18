//
//  ViewController.swift
//  face
//
//  Created by Michael Cramer on 7/18/16.
//  Copyright © 2016 Michael Cramer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var expression = FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile){
    didSet {
      updateUI()
    }
  }
  
  @IBOutlet weak var faceView: FaceView!
  
  private var mouthCurvatures = [
    FacialExpression.Mouth.Frown: -1.0,
    .Smirk: -0.5,
    .Neutral: 0,
    .Grin: 0.5,
    .Smile: 1.0
  ]
  
  private let eyeBrowTilts = [
    FacialExpression.EyeBrows.Relaxed: 0.5,
      .Normal: 0.0,
    .Furrowed: -0.5
  ]
  
  private func updateUI() {
    switch expression.eyes {
    case .Open:
      faceView.eyesOpen = true
    case .Closed:
      faceView.eyesOpen = false
    default: faceView.eyesOpen = false
    }
    faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
  }
  
  
  
  
}

