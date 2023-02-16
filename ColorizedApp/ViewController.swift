//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Кирилл Шалеников on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet var colourizedView: UIView!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    // MARK: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redSliderValue.text = "\(redSlider.value)"
        greenSliderValue.text = "\(greenSlider.value)"
        blueSliderValue.text = "\(blueSlider.value)"
        
        colourizedView.layer.cornerRadius = 20
    }

    
    // MARK: ACTIONS

    @IBAction func redSliderAction() {
        
        redSliderValue.text = "\(redSlider.value)"
        let backgroundColour = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        colourizedView.backgroundColor = backgroundColour
    }
    
    @IBAction func greenSliderAction() {
        greenSliderValue.text = "\(greenSlider.value)"
        
        let backgroundColour = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        colourizedView.backgroundColor = backgroundColour
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = "\(blueSlider.value)"
        
        let backgroundColour = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        colourizedView.backgroundColor = backgroundColour
    }
    
}
