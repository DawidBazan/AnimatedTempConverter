//
//  Emitter.swift
//  TempConverter
//
//  Created by BZN8 on 13/03/2018.
//  Copyright © 2018 BZN8. All rights reserved.
//

import UIKit

class Emitter {
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: image)
        
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        
        cell.scale = 0.4
        cell.scaleRange = 0.3
        
        cells.append(cell)
        
        return cells
    }
    
}
