//
//  FoodListVC.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 7.07.2022.
//

import UIKit

//Foods will be added by popup alert on this View Controller.


class FoodListVC: UIViewController {
    
    let tableView = UITableView()
    
    let viewModel = FoodViewModel()
    
    var food: [Food] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FoodList"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        configureAddBarButton()
        configureTableView()
        updateTableView()
        
        
    }
    
    func configureAddBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        
    }
    
    
    fileprivate func updateTableView() {
        
        viewModel.fetchData()
        tableView.reloadData()
        
    }
    
    
    
    @objc func addTapped() {

        makeAlertWithText(title: "Add Item", message: "", actionButtonTitle: "Add", cancelButtonTitle: "Cancel", placeholder1: "Enter Food Here", placeholder2: "Enter Cal Here") { foodText, caloriesText in
            
            //TODO:
            //save data to database
            
            if !foodText.isEmpty && !caloriesText.isEmpty {
                self.viewModel.saveData(foodTitle: foodText, foodCal: caloriesText)
                self.updateTableView()
            }
            
            
            //update foodList
        }
    }
    

    

}


extension FoodListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.foodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.foodArray[indexPath.row].foodTitle
        cell.detailTextLabel?.text = "Calories : \(viewModel.foodArray[indexPath.row].foodCal!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            viewModel.deleteData(index: indexPath.row)
            updateTableView()

        }
    }
    
    
    
    
}
