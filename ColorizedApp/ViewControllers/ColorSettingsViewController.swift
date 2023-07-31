//
//  ColourSettingsViewController.swift
//  ColorizedApp
//
//  Created by Кирилл Шалеников on 16.02.2023.
//

import UIKit

class ColorSettingsViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet var colourizedView: UIView!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderTextField: UITextField!
    @IBOutlet var greenSliderTextField: UITextField!
    @IBOutlet var blueSliderTextField: UITextField!
    
    // MARK: PUBLIC PROPERTIES
    var delegate: ColorSettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    
    // MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        redSliderValue.text = "\(redSlider.value)"
        greenSliderValue.text = "\(greenSlider.value)"
        blueSliderValue.text = "\(blueSlider.value)"
        
        colourizedView.layer.cornerRadius = 20
        colourizedView.backgroundColor = viewColor
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redSliderValue, greenSliderValue, blueSliderValue)
        setValue(for: redSliderTextField, greenSliderTextField, blueSliderTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    
    // MARK: ACTIONS

    @IBAction func allSliders(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redSliderValue)
            setValue(for: redSliderTextField)
        case greenSlider:
            setValue(for: greenSliderValue)
            setValue(for: greenSliderTextField)
        default:
            setValue(for: blueSliderValue)
            setValue(for: blueSliderTextField)
        }
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.setColor(colourizedView.backgroundColor ?? .white)
        dismiss(animated: true)
    }

   
}

// MARK: PRIVATE PROPERTIES
extension ColorSettingsViewController {
    
    private func setValue(for colourSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        colourSliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(ciColor.red)
            case greenSlider:
                greenSlider.value = Float(ciColor.green)
            default:
                blueSlider.value = Float(ciColor.blue)
            }
        }
    }

    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redSliderValue:
                label.text = string(from: redSlider)
            case greenSliderValue:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }

    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redSliderValue:
                textField.text = string(from: redSlider)
            case greenSliderValue:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setColor() {
        colourizedView.backgroundColor = UIColor(
        red: CGFloat(redSlider.value),
        green: CGFloat(greenSlider.value),
        blue: CGFloat(blueSlider.value),
        alpha: 1
        )
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

