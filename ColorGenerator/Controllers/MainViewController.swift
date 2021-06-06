//
//  MainViewController.swift
//  ColorGenerator
//
//  Created by Anna Ostapenko on 06.06.21.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainViewContainer: UIView!
    
    private var backgroundColor = Color(redValue: 255, greenValue: 255, blueValue: 255, alphaValue: 0.5) {
        didSet {
        
            mainViewContainer.backgroundColor = backgroundColor.getColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewContainer.backgroundColor = backgroundColor.getColor
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue)  {
        guard let colorGeneratorVC = segue.source as? ColorGeneratorViewController else { return }
        colorGeneratorVC.delegate = self
        backgroundColor =  colorGeneratorVC.backgroundColor ?? Color(redValue: 255, greenValue: 255, blueValue: 255, alphaValue: 0.5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let colorGeneratorVC = navigationVC.topViewController as? ColorGeneratorViewController else {return}
        colorGeneratorVC.backgroundColor = backgroundColor
    }
}


extension MainViewController: ColorGeneratorViewControllerDelegate {
    func updateViewControllerColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}
