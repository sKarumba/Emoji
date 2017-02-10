//
//  Emoji.swift
//  Emoji
//
//  Created by Karumba Samuel on 08/02/2017.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class Emoji: UIView {
    private var scale: CGFloat = 0.90
    private var skullRadius: CGFloat {
            return min(bounds.size.width, bounds.size.height) / 2 * scale
        }
    
    private var skullCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private struct Ratio {
        static let SkullRadiusToEyeOffset: CGFloat = 3
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouthOffset: CGFloat = 3
        static let SkullRadiusToMouthWidth: CGFloat = 1
        static let SkullRadiusToMouthHeight: CGFloat = 3
        
    }
    
    private enum Eye {
        case Left
        case Right
    }
    
    private func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: false)
        path.lineWidth = 3.0

        return path
    }
    
    private func getEyeCenter(eye: Eye) -> CGPoint {
        let eyeOffset = skullRadius / Ratio.SkullRadiusToEyeOffset
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left:
            eyeCenter.x -= eyeOffset
        case .Right:
            eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    
    private func PathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = skullRadius / Ratio.SkullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye: eye)
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
        
    }
    override func draw(_ rect: CGRect) {
                
        UIColor.red.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        PathForEye(eye: .Left).stroke()
        PathForEye(eye: .Right).stroke()

    }
    

}
