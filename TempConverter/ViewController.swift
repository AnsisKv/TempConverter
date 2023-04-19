//
//  ViewController.swift
//  TempConverter
//
//  Created by kvelde.niklavs.ansis on 17/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var tempSegmentController: UISegmentedControl!
    
    @IBOutlet weak var tempSlider: UISlider!{
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        celsiusLabel.text = "32 Fº"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        print("tempSlider:", tempSlider.value)
        updateResultLabelValue(value: tempSlider.value)
    }
    
    
    @IBAction func segmentValueChange(_ sender: Any) {
        updateResultLabelValue(value: tempSlider.value)
    }
    
    func updateResultLabelValue(value: Float){
    print(value)
        
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) Cº"
    
        var convertedTempString = ""
        switch tempSegmentController.selectedSegmentIndex{
        case 0:
            let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahrenheitTempString + " Fº"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " Kº"
        }
        resultLabel.text = convertedTempString
    }
    
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double){
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return(fahrenheit,kelvin)
    }
    
}

