//
//  ViewController.swift
//  hw3
//
//  Created by Alexandru Brixencov on 01.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redCountLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    @IBOutlet weak var blueCountLabel: UILabel!
    
    @IBOutlet weak var redRequestLabel: UILabel!
    @IBOutlet weak var greenRequestLabel: UILabel!
    @IBOutlet weak var blueRequestLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var mainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeViewColor()
        makeCorrectTextLabel()
        setRandomLabel()
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
    
    @IBAction func submitButtonPressed() {
        guard redCountLabel.text == redRequestLabel.text, 
                greenCountLabel.text == greenRequestLabel.text,
                blueCountLabel.text == blueRequestLabel.text
        else {showIssueAlert(with: "Неверный rgb", and: "Проверьте ваши цвета")
            return}
        guard mainTextField.text == compareMaxNum() else {showIssueAlert(with: "Неверно введен цвет", and: "Проверьте правильность ввода")
            return}
        showSuccesfulAlert(with: "Поздравляем!", and: "У вас всё получилось :)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            submitButtonPressed()
            return true
        }
    
 
//MARK: - PrivateMethods
    private func changeViewColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1)
    }
    
    private func makeCorrectTextLabel() {
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setRandomLabel() {
        let minValue = 0.00
        let maxValue = 1.00
        
        redRequestLabel.text = String(format: "%.2f", Double.random(in: minValue...maxValue))
        greenRequestLabel.text = String(format: "%.2f", Double.random(in: minValue...maxValue))
        blueRequestLabel.text = String(format: "%.2f", Double.random(in: minValue...maxValue))
    }
    
   private func compareMaxNum() -> String {
        var maxValue = 0.00
        
        if let redValue = Double(redRequestLabel.text!) {
            maxValue = redValue
            if let greenValue = Double(greenRequestLabel.text!) {
                if greenValue > maxValue {
                    maxValue = greenValue
                }
            }
            if let blueValue = Double(blueRequestLabel.text!) {
                if blueValue > maxValue {
                    maxValue = blueValue
                }
            }
        }
       
       switch maxValue {
       case Double(redRequestLabel.text!):
           return "Red"
       case Double(greenRequestLabel.text!):
           return "Green"
       case Double(blueRequestLabel.text!):
           return "Blue"
       default:
           return ""
       }
    }
}

extension ViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - UIAlertController
extension ViewController {
    private func showIssueAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, 
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.mainTextField.text = ""}
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func showSuccesfulAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, 
                                      message: message,
                                      preferredStyle: .alert)
        
        let repeatAction = UIAlertAction(title: "Повторить", style: .default) { _ in
            self.redSlider.value = 0.50
            self.greenSlider.value = 0.50
            self.blueSlider.value = 0.50
            self.mainTextField.text = ""
            self.setRandomLabel()
            self.makeCorrectTextLabel()
        }
        alert.addAction(repeatAction)
        
        present(alert, animated: true)
    }
}
