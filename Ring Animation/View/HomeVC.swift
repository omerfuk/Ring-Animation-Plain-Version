//
//  HomeVC.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 7.07.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    var foodListImageView = UIImageView()
    var workoutListImageView = UIImageView()
    var trainImageView = UIImageView()
    var infoImageView = UIImageView()
    var headerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        configureHeaderLabel()
        configureFoodListImageView()
        configureWorkOutListImageView()
        configureTrainImageView()
        configureInfoImageView()
     
    }
    
    func configureHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .label
        headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 30)
        headerLabel.text = "Welcome to our XXXX"
        
        NSLayoutConstraint.activate([
        
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
        
    }
    
    func configureFoodListImageView() {
        
        view.addSubview(foodListImageView)
        configureImageViews(imageView: foodListImageView)
        foodListImageView.translatesAutoresizingMaskIntoConstraints = false
        foodListImageView.image = UIImage(named: "car1")
        
        NSLayoutConstraint.activate([
        
            foodListImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 120),
            foodListImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            foodListImageView.widthAnchor.constraint(equalToConstant: 150),
            foodListImageView.heightAnchor.constraint(equalToConstant: 150)
        
        
        ])
        
    }
    
    func configureWorkOutListImageView() {
        
        view.addSubview(workoutListImageView)
        configureImageViews(imageView: workoutListImageView)
        workoutListImageView.translatesAutoresizingMaskIntoConstraints = false
        workoutListImageView.image = UIImage(named: "car2")
        
        
        NSLayoutConstraint.activate([
        
            workoutListImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 120),
            workoutListImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            workoutListImageView.widthAnchor.constraint(equalToConstant: 150),
            workoutListImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    func configureTrainImageView() {
        
        view.addSubview(trainImageView)
        configureImageViews(imageView: trainImageView)
        trainImageView.translatesAutoresizingMaskIntoConstraints = false
        trainImageView.image = UIImage(named: "car3")
        
        NSLayoutConstraint.activate([
            
            trainImageView.topAnchor.constraint(equalTo: foodListImageView.bottomAnchor, constant: 30),
            trainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            trainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            trainImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureInfoImageView() {
        
        view.addSubview(infoImageView)
        configureImageViews(imageView: infoImageView)
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        infoImageView.image = UIImage(named: "car4")
        
        NSLayoutConstraint.activate([
        
            infoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            infoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            infoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            infoImageView.heightAnchor.constraint(equalToConstant: 100)
            
        
        ])
        
    }
    
    func configureImageViews(imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImageView = tapGestureRecognizer.view as! UIImageView
        let tappedEggStyle:String
        
        let countdownVC = CountdownVC()
        let foodListVC = FoodListVC()
        
        switch tappedImageView {
            
        case foodListImageView:
            print("Food list image View tapped")
            
            navigationController?.pushViewController(foodListVC, animated: true)
            
            break
            
        case workoutListImageView:
            makeAlert(title: "FOODLIST", message: "Workoutlist ImageView Tapped")
            break
            
        case trainImageView:
            
            navigationController?.pushViewController(countdownVC, animated: true)
            break
            
        case infoImageView:
            makeAlert(title: "FOODLIST", message: "info ImageView Tapped")
            
        default:
            
            break
            
        }

    }
    



}



