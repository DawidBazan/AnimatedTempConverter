//
//  ViewController.swift
//  TempConverter
//
//  Created by Dawid Bazan  on 22/01/2018.
//  Copyright © 2018 Dawid Bazan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var tempChoice: UISegmentedControl!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var convertBtn: UIButton!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = ""
        convertBtn.layer.cornerRadius = 20
    }
    
 
    
    @IBAction func OnClick(_ sender: Any) {
        
        if input.text != "" {
           
            index = tempChoice.selectedSegmentIndex
            let temp = Int(input.text!)
            
            if index == 0, temp! <= 40{
                snow()
                self.view.backgroundColor = UIColor.blue
                image.image = UIImage(named: "flake")
            }
            
            else if index == 0, temp! >= 40{
                self.view.backgroundColor = UIColor.yellow
                image.image = UIImage(named: "sun")
            }
            
            if index == 1, temp! <= 5{
                snow()
                self.view.backgroundColor = UIColor.blue
                image.image = UIImage(named: "flake")
            }
            
            else if index == 1, temp! >= 5{
                self.view.backgroundColor = UIColor.yellow
                image.image = UIImage(named: "sun")
                
            }
            
            if index == 0 {
               
                let converted = (temp! - 32) * 5/9
                result.text = "\(converted)C"
        }
            if index == 1 {
                
                let converted = (temp! * 9/5) + 32
                result.text = "\(converted)F"
                
            }
        }
    }
    
    func snow(){

        let emitter = Emitter.get(with: #imageLiteral(resourceName: "snow"))
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
    }
}

