//
//  ViewController.swift
//  ColorGenerator
//
//  Created by Anna Ostapenko on 21.05.21.
//

import UIKit

protocol ColorGeneratorViewControllerDelegate {
    func updateViewControllerColor(color: UIColor)
}


class ColorGeneratorViewController: UIViewController {
    
    @IBOutlet weak var generatedColor: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    
    @IBOutlet weak var redValueTF: UITextField!
    @IBOutlet weak var greenValueTF: UITextField!
    @IBOutlet weak var blueValueTF: UITextField!
    @IBOutlet weak var alphaValueTF: UITextField!
    
    
    @IBOutlet weak var colorToCopy: UITextField!
    
    @IBOutlet weak var colorSegmentControlValue: UISegmentedControl!
    
    var backgroundColor: Color?
    
    var delegate: ColorGeneratorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        generatedColor.layer.cornerRadius = 10
        generatedColor.layer.borderWidth = 1
        generatedColor.layer.borderColor = UIColor.gray.cgColor
        
        colorToCopy.text = String(colorSegmentControlValue.selectedSegmentIndex)
        colorToCopy.isUserInteractionEnabled = false
        
        
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
        alphaValueLabel.text = String(alphaSlider.value)
        
        generatedColor.backgroundColor = backgroundColor?.getColor
        calculateSliderValues()
        calculateSegmentColorValue()
        
        calculateSliderValuesTF()
    }
    
    @IBAction func onSliderValueChanged() {
        calculateSliderValuesTF()
        redSlider.tintColor = setSliderTintColor(red: redSlider.value, green: 0, blue: 0, alpha: alphaSlider.value)
        greenSlider.tintColor = setSliderTintColor(red: 0, green: greenSlider.value, blue: 0, alpha: alphaSlider.value)
        blueSlider.tintColor = setSliderTintColor(red: 0, green: 0, blue: blueSlider.value, alpha: alphaSlider.value)
        alphaSlider.tintColor = setSliderTintColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: alphaSlider.value)
        setGeneratedColor()
        calculateSegmentColorValue()
    }
    
    
    @IBAction func onSegmentControlValueChanged() {
        calculateSegmentColorValue()
        
    }
    
    @IBAction func onCopyColorClick() {
        UIPasteboard.general.string = colorToCopy.text
        let alert = UIAlertController(title: "You have copied the color", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onDoneButtonPressed() {
        delegate?.updateViewControllerColor(color: generatedColor.backgroundColor ?? UIColor.red)
    }
    
    @IBAction func onSliderValueTFChanged(_ sender: UITextField) {
        calculateSliderValuesLabels()
        calculateSliderValues()
        updateSliderValues()
        setGeneratedColor()
    }
    
    private func setGeneratedColor() -> Void {
        backgroundColor = Color(redValue: redSlider.value, greenValue: greenSlider.value, blueValue: blueSlider.value, alphaValue: alphaSlider.value)
        generatedColor.backgroundColor = backgroundColor?.getColor
    }
    
    private func setSliderTintColor (red: Float, green: Float, blue: Float, alpha: Float) -> UIColor {
        UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha))
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
    
    private func calculateSliderValues() {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        
        if ((backgroundColor?.getColor.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)) != nil){
            let iRed = Float(fRed * 255.0)
            let iGreen = Float(fGreen * 255.0)
            let iBlue = Float(fBlue * 255.0)
            let iAlpha = Float(fAlpha)
            
            redSlider.value = iRed
            greenSlider.value = iGreen
            blueSlider.value = iBlue
            alphaSlider.value = iAlpha
        }
    }
    
    private func updateSliderValues() {
        redSlider.value = Float(String(redValueTF.text ?? "0")) ?? 0
        greenSlider.value = Float(String(greenValueTF.text ?? "0")) ?? 0
        blueSlider.value = Float(String(blueValueTF.text ?? "0")) ?? 0
        alphaSlider.value = Float(String(alphaValueTF.text ?? "0")) ?? 0
        
        redSlider.tintColor = setSliderTintColor(red: redSlider.value, green: 0, blue: 0, alpha: alphaSlider.value)
        greenSlider.tintColor = setSliderTintColor(red: 0, green: greenSlider.value, blue: 0, alpha: alphaSlider.value)
        blueSlider.tintColor = setSliderTintColor(red: 0, green: 0, blue: blueSlider.value, alpha: alphaSlider.value)
        alphaSlider.tintColor = setSliderTintColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: alphaSlider.value)
    }
    
    private func calculateSliderValuesTF(){
        redValueTF.text = getRoundedValueText(colorSlider: redSlider)
        greenValueTF.text = getRoundedValueText(colorSlider: greenSlider)
        blueValueTF.text = getRoundedValueText(colorSlider: blueSlider)
        alphaValueTF.text = getRoundedValueText(colorSlider: alphaSlider)
        calculateSliderValuesLabels()
    }
    
    private func calculateSliderValuesLabels() {
        redValueLabel.text = redValueTF.text 
        greenValueLabel.text = greenValueTF.text
        blueValueLabel.text = blueValueTF.text
        alphaValueLabel.text = alphaValueTF.text
        
    }
}

extension ColorGeneratorViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}
