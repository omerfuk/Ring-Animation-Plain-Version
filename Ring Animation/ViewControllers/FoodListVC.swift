//
//  FoodListVC.swift
//  Ring Animation
//
//  Created by Ömer Faruk Kılıçaslan on 7.07.2022.
//

import UIKit

//Foods will be added by popup alert on this View Controller.


class FoodListVC: UIViewController {
    
    var tableView = UITableView()
    var food: [Food] = []
    
    var selectedTextLabel = ""
    var selectedDetailTextLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        configureAddBarButton()
        tableView.reloadData()
    }
    
    func configureAddBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: .alert)
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter Second Name"
            }
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                let secondTextField = alertController.textFields![1] as UITextField
                
                
                
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
            alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Enter First Name"
            }

            alertController.addAction(saveAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
    }
    

    

}


extension FoodListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello World"
        cell.detailTextLabel?.text = "Hello World"
        return cell
    }
    
    
    
    
}
