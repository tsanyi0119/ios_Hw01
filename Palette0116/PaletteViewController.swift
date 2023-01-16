//
//  PaletteViewController.swift
//  Palette0116
//
//  Created by imac-1681 on 2023/1/16.
//

import UIKit

class PaletteViewController: UIViewController {

    @IBOutlet weak var paletteView: UIView!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var greenSilder: UISlider!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaTextField: UITextField!
    @IBOutlet weak var alphaSilder: UISlider!
    
    var redValue:Float = 0.0
    var greenValue:Float = 0.0
    var blueValue:Float = 0.0
    var alphaValue:Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //設定UI樣式
    func setupUI(){
        paletteView.backgroundColor = .lightGray
        //TextField
        setupTextField(textField:redTextField, tag:0)
        setupTextField(textField:greenTextField, tag:1)
        setupTextField(textField:blueTextField, tag:2)
        setupTextField(textField:alphaTextField, tag:3)
        
        //Silder
        setupSlider(silder:redSlider, tag:0)
        setupSlider(silder:greenSilder, tag:1)
        setupSlider(silder:blueSlider, tag:2)
        setupSlider(silder:alphaSilder, tag:3)
        
        //Tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        
        //PaletteView
        paletteView.layer.borderWidth = 2
        paletteView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    /// 設定UITextField樣式
    /// - Parameters:
    ///   - textField: 要設定的UITextField
    ///   - tag: UITextField的tag
    private func setupTextField(textField:UITextField, tag:Int){
        textField.keyboardType = .numberPad
        textField.tag = tag
        if(tag == 3){
            textField.text = "1"
        }else{
            textField.text = "0"
        }
    }
    
    /// 設定UISlider樣式
    /// - Parameters:
    ///   - silder: 要設定的UISlider
    ///   - tag: UISlider的tag
    private func setupSlider(silder:UISlider, tag:Int){
        silder.tag = tag
        silder.value = (tag==3) ? 1 : 0
    }
    
    //關鍵盤
    @objc func closeKeyboard(){
        view.endEditing(true)
    }
    
    func showAlert(title:String?,message:String?,confirmTitle:String,confirm:(() -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "關閉", style: .default){ _ in
            confirm?()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        guard let text = sender.text, !(text.isEmpty) else{
            return
        }
        guard let textToFloat = Float(text), textToFloat<=255 else{
            showAlert(title: "錯誤", message: "糗輸入0-255之間的數值", confirmTitle: "關閉"){
                switch sender.tag{
                case 0 :
                    sender.text = "0"
                    self.redSlider.value = 0
                    self.redValue = 0
                    self.redSlider.minimumTrackTintColor = UIColor(red: CGFloat(255)/255,
                                                                   green: CGFloat(255)/255,
                                                                   blue: CGFloat(255)/255,
                                                                   alpha: CGFloat(1))
                    self.redSlider.thumbTintColor = UIColor(red: CGFloat(255)/255,
                                                            green: CGFloat(255)/255,
                                                            blue: CGFloat(255)/255,
                                                            alpha: CGFloat(1))
                    
                case 1 :
                    sender.text = "0"
                    self.greenSilder.value = 0
                    self.greenValue = 0
                    self.greenSilder.minimumTrackTintColor = UIColor(red: CGFloat(255)/255,
                                                                     green: CGFloat(255)/255,
                                                                     blue: CGFloat(255)/255,
                                                                     alpha: CGFloat(1))
                    self.greenSilder.thumbTintColor = UIColor(red: CGFloat(255)/255,
                                                              green: CGFloat(255)/255,
                                                              blue: CGFloat(255)/255,
                                                              alpha: CGFloat(1))
                case 2 :
                    sender.text = "0"
                    self.blueSlider.value = 0
                    self.blueValue = 0
                    self.blueSlider.minimumTrackTintColor = UIColor(red: CGFloat(255)/255,
                                                                    green: CGFloat(255)/255,
                                                                    blue: CGFloat(255)/255,
                                                                    alpha: CGFloat(1))
                    self.blueSlider.thumbTintColor = UIColor(red: CGFloat(255)/255,
                                                             green: CGFloat(255)/255,
                                                             blue: CGFloat(255)/255,
                                                             alpha: CGFloat(1))
                case 3 :
                    sender.text = "1"
                    self.alphaSilder.value = 1
                    self.alphaValue = 0
                default:
                    break
                }
                self.paletteView.backgroundColor = .lightGray
                self.view.backgroundColor = UIColor(red: CGFloat(255)/255,
                                                    green: CGFloat(255)/255,
                                                    blue: CGFloat(255)/255,
                                                    alpha: CGFloat(1))
            }
            return
        }
        switch sender.tag{
        case 0 :
            redValue = textToFloat
            redSlider.value = textToFloat
            redSlider.minimumTrackTintColor = UIColor(red: CGFloat(redValue)/255,
                                                      green: CGFloat(0),
                                                      blue: CGFloat(0),
                                                      alpha: CGFloat(1))
            redSlider.thumbTintColor = UIColor(red: CGFloat(redValue)/255,
                                               green: CGFloat(0),
                                               blue: CGFloat(0),
                                               alpha: CGFloat(1))
        case 1 :
            greenValue = textToFloat
            greenSilder.value = textToFloat
            greenSilder.minimumTrackTintColor = UIColor(red: CGFloat(0),
                                                        green: CGFloat(greenValue)/255,
                                                        blue: CGFloat(0),
                                                        alpha: CGFloat(1))
            greenSilder.thumbTintColor = UIColor(red: CGFloat(0),
                                                 green: CGFloat(greenValue)/255,
                                                 blue: CGFloat(0),
                                                 alpha: CGFloat(1))
        case 2 :
            blueValue = textToFloat
            blueSlider.value = textToFloat
            blueSlider.minimumTrackTintColor = UIColor(red: CGFloat(0),
                                                       green: CGFloat(0),
                                                       blue: CGFloat(blueValue)/255,
                                                       alpha: CGFloat(1))
            blueSlider.thumbTintColor = UIColor(red: CGFloat(0),
                                                green: CGFloat(0),
                                                blue: CGFloat(blueValue)/255,
                                                alpha: CGFloat(1))
        case 3 :
            alphaValue = textToFloat
            alphaSilder.value = textToFloat
        default:
            break
        }
        paletteView.backgroundColor = UIColor(red: CGFloat(redValue)/255,
                                              green: CGFloat(greenValue)/255,
                                              blue: CGFloat(blueValue)/255,
                                              alpha: CGFloat(alphaValue))
        view.backgroundColor = UIColor(red: CGFloat(redValue)/255,
                                       green: CGFloat(greenValue)/255,
                                       blue: CGFloat(blueValue)/255,
                                       alpha: CGFloat(alphaValue))
    }
    
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        switch sender.tag{
        case 0 :
            redValue = sender.value
            redTextField.text = "\(Int(sender.value))"
//            redTextField.text = String(format: "%.2f", redValue)
            redSlider.minimumTrackTintColor = UIColor(red: CGFloat(redValue)/255,
                                                      green: CGFloat(0),
                                                      blue: CGFloat(0),
                                                      alpha: CGFloat(1))
            redSlider.thumbTintColor = UIColor(red: CGFloat(redValue)/255,
                                               green: CGFloat(0),
                                               blue: CGFloat(0),
                                               alpha: CGFloat(1))
        case 1 :
            greenValue = sender.value
            greenTextField.text = "\(Int(sender.value))"
            greenSilder.minimumTrackTintColor = UIColor(red: CGFloat(0),
                                                        green: CGFloat(greenValue)/255,
                                                        blue: CGFloat(0),
                                                        alpha: CGFloat(1))
            greenSilder.thumbTintColor = UIColor(red: CGFloat(0),
                                                 green: CGFloat(greenValue)/255,
                                                 blue: CGFloat(0),
                                                 alpha: CGFloat(1))
        case 2 :
            blueValue = sender.value
            blueTextField.text = "\(Int(sender.value))"
            blueSlider.minimumTrackTintColor = UIColor(red: CGFloat(0),
                                                       green: CGFloat(0),
                                                       blue: CGFloat(blueValue)/255,
                                                       alpha: CGFloat(1))
            blueSlider.thumbTintColor = UIColor(red: CGFloat(0),
                                                green: CGFloat(0),
                                                blue: CGFloat(blueValue)/255,
                                                alpha: CGFloat(1))
        case 3 :
            alphaValue = sender.value
            alphaTextField.text = String(format: "%.1f", alphaValue)
        default:
            break
        }
        paletteView.backgroundColor = UIColor(red: CGFloat(redValue)/255,
                                              green: CGFloat(greenValue)/255,
                                              blue: CGFloat(blueValue)/255,
                                              alpha: CGFloat(alphaValue))
        view.backgroundColor = UIColor(red: CGFloat(redValue)/255,
                                       green: CGFloat(greenValue)/255,
                                       blue: CGFloat(blueValue)/255,
                                       alpha: CGFloat(alphaValue))
    }
}
