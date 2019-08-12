//
//  ViewController.swift
//  Weather
//
//  Created by HoaPQ on 8/12/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewChart: UIView!
    
    var pointsY: [CGFloat] = [0.2, 0.8, 0.5, 0.6, 0.3, 0.7, 0.5, 0.4, 0.6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawLine(pointY: pointsY)
    }
    
    func drawLine(pointY: [CGFloat]) {
        let viewHeight = viewChart.frame.height
        let viewWidth = viewChart.frame.width
        var points: [CGPoint] = []
        for i in 0..<pointY.count {
            let y = (1 - pointY[i]) * viewHeight
            let x = CGFloat(i) * viewWidth / CGFloat(pointY.count-1)
            
            let point = CGPoint(x: x, y: y)
            points.append(point)
            
            let layer = CAShapeLayer()
            let path = UIBezierPath(arcCenter: point, radius: 5, startAngle: 0, endAngle: .pi * 2, clockwise: true)
            layer.fillColor = UIColor.blue.cgColor
            layer.path = path.cgPath
            
            viewChart.layer.addSublayer(layer)
        }
        
        if let line = CurveAlgorithm.shared.createCurvedPath(points) {
            let layer = CAShapeLayer()
            layer.path = line.cgPath
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = 5.0
            layer.strokeColor = UIColor.blue.cgColor
            
            viewChart.layer.addSublayer(layer)
        }
        
    }


}

