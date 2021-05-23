//
//  ViewController.swift
//  ColorGenerator
//
//  Created by Anna Ostapenko on 21.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var generatedColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var colorToCopy: UITextField!
    
    @IBOutlet weak var colorSegmentControlValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatedColor.layer.cornerRadius = 10
        generatedColor.layer.borderWidth = 1
        generatedColor.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        colorToCopy.text = String(colorSegmentControlValue.selectedSegmentIndex)
        
        
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
        alphaValueLabel.text = String(alphaSlider.value)
        
        generatedColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        calculateSegmentColorValue()
        
    }
    
    private func setGeneratedColor() -> Void {
        generatedColor.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: CGFloat(alphaSlider.value))
    }
    
    private func getRoundedValueText (colorSlider: UISlider) -> String {
        String(format: "%0.1f", colorSlider.value)
    }
    
    private func calculateSegmentColorValue () -> Void {
        var colorToCopyText = ""
        switch colorSegmentControlValue.selectedSegmentIndex {
        case 0:
            let rgbaValue = "(\(String(format: "%0.0f", redSlider.value)), \(String(format: "%0.0f", greenSlider.value)), \(String(format: "%0.0f", blueSlider.value)), \(String(format: "%0.1f", alphaSlider.value)))"
            colorToCopyText = rgbaValue
        case 1:
            let hexValue = "#\(String(format:"%02X", Int(redSlider.value)) + String(format:"%02X", Int(greenSlider.value)) + String(format:"%02X", Int(blueSlider.value)))"
            colorToCopyText = hexValue
        default:
            colorToCopyText = "unknown color system"
        }
        colorToCopy.text = colorToCopyText
    }
    
    @IBAction func onRedValueChanged(_ sender: UISlider) {
        redValueLabel.text = getRoundedValueText(colorSlider: redSlider)
        setGeneratedColor()
        calculateSegmentColorValue()
    }
    
    @IBAction func onGreenValueChanged(_ sender: UISlider) {
        greenValueLabel.text = getRoundedValueText(colorSlider: greenSlider)
        setGeneratedColor()
        calculateSegmentColorValue()
    }
    @IBAction func onBlueValueChanged(_ sender: UISlider) {
        blueValueLabel.text = getRoundedValueText(colorSlider: blueSlider)
        setGeneratedColor()
        calculateSegmentColorValue()
    }
    
    @IBAction func onAlphaValueChanged(_ sender: UISlider) {
        alphaValueLabel.text = getRoundedValueText(colorSlider: alphaSlider)
        setGeneratedColor()
        calculateSegmentColorValue()
    }
    
    @IBAction func onSegmentControlValueChanged() {
        calculateSegmentColorValue()
        
    }
    
    
    
}

