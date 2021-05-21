//
//  ViewController.swift
//  ColorGenerator
//
//  Created by Anna Ostapenko on 21.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var generatedColor: UIView!
    
    @IBOutlet weak var redValue: UISlider!
    @IBOutlet weak var greenValue: UISlider!
    @IBOutlet weak var blueValue: UISlider!
    @IBOutlet weak var alphaValue: UISlider!
    
    @IBOutlet weak var displayRedValue: UILabel!
    @IBOutlet weak var displayGreenValue: UILabel!
    @IBOutlet weak var displayBlueValue: UILabel!
    @IBOutlet weak var alphaDisplayValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatedColor.layer.cornerRadius = 10
        generatedColor.layer.borderWidth = 1
        generatedColor.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        displayRedValue.text = String(redValue.value)
        displayGreenValue.text = String(greenValue.value)
        displayBlueValue.text = String(blueValue.value)
        alphaDisplayValue.text = String(alphaValue.value)
        
        generatedColor.backgroundColor = UIColor(red: CGFloat(redValue.value), green: CGFloat(greenValue.value), blue: CGFloat(blueValue.value), alpha: CGFloat(alphaValue.value))
        
    }
    
    @IBAction func onRedValueChanged(_ sender: UISlider) {
        displayRedValue.text = String(round(redValue.value))
        generatedColor.backgroundColor = UIColor(red: CGFloat(redValue.value) / 255, green: CGFloat(greenValue.value) / 255, blue: CGFloat(blueValue.value) / 255,alpha: CGFloat(alphaValue.value))
        
    }
    @IBAction func onGreenValueChanged(_ sender: UISlider) {
        displayGreenValue.text = String(round(greenValue.value))
        generatedColor.backgroundColor = UIColor(red: CGFloat(redValue.value) / 255, green: CGFloat(greenValue.value) / 255, blue: CGFloat(blueValue.value) / 255, alpha: CGFloat(alphaValue.value))
    }
    @IBAction func onBlueValueChanged(_ sender: UISlider) {
        displayBlueValue.text = String(round(blueValue.value))
        generatedColor.backgroundColor = UIColor(red: CGFloat(redValue.value) / 255, green: CGFloat(greenValue.value) / 255, blue: CGFloat(blueValue.value) / 255, alpha: CGFloat(alphaValue.value))
    }
    
    @IBAction func onAlphaValueChanged(_ sender: UISlider) {
        alphaDisplayValue.text = String(alphaValue.value)
        generatedColor.backgroundColor = UIColor(red: CGFloat(redValue.value) / 255, green: CGFloat(greenValue.value) / 255, blue: CGFloat(blueValue.value) / 255, alpha: CGFloat(alphaValue.value))
    }
    
    
    
}

