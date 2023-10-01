//
//  ViewController.swift
//  hw3
//
//  Created by Alexandru Brixencov on 01.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redCountLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    @IBOutlet weak var blueCountLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewColor()
        
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
    }

    @IBAction func redSliderAction(_ sender: UISlider) {
        changeViewColor()
    
        switch sender {
        case redSlider:
            redCountLabel.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        case blueSlider:
            blueCountLabel.text = String(format: "%.2f", blueSlider.value)
        default:
            break
        }
        
    }
    
    private func changeViewColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value), 
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value), 
                                           alpha: 1)
    }
}

