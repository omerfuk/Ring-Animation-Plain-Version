//
//  ViewController.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 5.07.2022.
//

import UIKit

class CountdownVC: UIViewController {
    
    
    
    var timerClass = Timer()
    var counter: Double!
    
    let shape = CAShapeLayer()
    
    let pointerLabel = UILabel()
    let timeTextfield = UITextField()
    
    var pauseButton = UIButton()
    var continueButton = UIButton()
    
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Calorie Goal"
        label.font = .systemFont(ofSize: 36, weight: .light)
        label.sizeToFit()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.center = view.center
        
        configureShape()
        configureAnimateButton()
        configurePointerLabel()
        configureTimeTextfield()
        
        configurePauseButton()
        configureContinueButton()
        
        
    }
    
    
    @objc func pauseButtonPressed() {
        timerClass.invalidate()
    }
    
    
    
    @objc func continueButtonPressed(){
                
        
        
    }
    
    @objc func timeForLabel() {
        
        
        label.text = "\(counter!)"
        if counter >= 0 {
            counter -= 1
            label.text = "\(counter!)"
            
        }

    }
    
    //
    
    func configureAnimateButton(){
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 70, width: view.frame.size.width - 40, height: 50))
        view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapAnimateButton), for: .touchUpInside)
        
    }
    
    @objc func didTapAnimateButton() {
        if let doubleValue = Double(timeTextfield.text!) {
            //Animate
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.toValue = 1
            animation.duration = doubleValue + 3
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            shape.add(animation, forKey: "animationxx")
        } else {
            makeAlert(title: "ERROR", message: "Not a valid number: \(timeTextfield.text!)")
        }
        
    }
    
    //
    
    
    
    
    


}

extension CountdownVC {
    
    //Button properties for all buttons
    func configureAllButtons(button:UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green

    }
    
    //Shape configuration
    func configureShape() {
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2) , endAngle: .pi * 2, clockwise: true)
        
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 15
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
    }
    
    
    func configureContinueButton() {
        
        view.addSubview(continueButton)
        configureAllButtons(button: continueButton)
        continueButton.setTitle("▶️", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            continueButton.widthAnchor.constraint(equalToConstant: 50),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
    }
    
    
    func configurePointerLabel() {
        
        view.addSubview(pointerLabel)
        pointerLabel.translatesAutoresizingMaskIntoConstraints = false
        pointerLabel.textColor = .label
        pointerLabel.font = UIFont(name: pointerLabel.font.fontName, size: 30)
        pointerLabel.text = "Please set the time"
        pointerLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            
            pointerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pointerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointerLabel.heightAnchor.constraint(equalToConstant: 30)
        
        
        ])
        
    }
    
    func configureTimeTextfield() {
        
        view.addSubview(timeTextfield)
        timeTextfield.translatesAutoresizingMaskIntoConstraints = false
        timeTextfield.placeholder = "Give a time value"
        timeTextfield.textAlignment = .center
        timeTextfield.layer.borderWidth = 2
        timeTextfield.layer.borderColor = UIColor.red.cgColor
        timeTextfield.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            
            timeTextfield.topAnchor.constraint(equalTo: pointerLabel.bottomAnchor, constant: 20),
            timeTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeTextfield.widthAnchor.constraint(equalToConstant: view.frame.size.width - 100),
            timeTextfield.heightAnchor.constraint(equalToConstant: 50)
            
        
        
        ])
    }
    
    func configurePauseButton() {
        
        view.addSubview(pauseButton)
        configureAllButtons(button: pauseButton)
        pauseButton.setTitle("||", for: .normal)
        pauseButton.setTitleColor(.white, for: .normal)
        
        pauseButton.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            pauseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            pauseButton.widthAnchor.constraint(equalToConstant: 50),
            pauseButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        ])
    }
    
}
