//
//  ViewController.swift
//  TableViews
//
//  Created by Maitree Bain on 11/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Topics covered:
    /*
    - UITableView
    -cells can be static or dynamic
    -protoype cell
    - reuse identifier e.g. "countryCell"
    - dataSource object (WE NEED TO SET THE DATASOURCE OBJECT e.g tableView.dataSource = self), configured in viewDidLoad()
    - UITableViewDataSource - 2 required 
    
    
    
  */

    //MARK: - outlets and properties
    
    @IBOutlet weak var tableView: UITableView!
    
    //data for the table view // [Country]
    private var countries = [Country]() {
        // property observer
        didSet {
            //reload tableView
            // reloads all of the rows of the tableView
            tableView.reloadData()
        }
    }
    
    private var sortAscending = false
    
    
    @IBAction func sortButtonPressed(_ sender: UIBarButtonItem) {
        sortAscending.toggle()
        sortData(sortAscending)
    }
    
    func sortData(_ sortAscending: Bool) {
        if sortAscending {
            countries = Country.countries.sorted { $0.name < $1.name }
            //our table view reloads because we are using a property observer didSet {...}
            //update the UIBarButtonItem title
            navigationItem.rightBarButtonItem?.title = "Sort Ascending"
        } else  {
            countries = Country.countries.sorted { $0.name > $1.name }
            navigationItem.rightBarButtonItem?.title = "Sort Descending"
        }
    }
    
    //MARK: - viewcontroller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the data source object
        //Step 1: set the data source object
        //meaning the object that will provide the table view its data (cell data)
       
        tableView.dataSource = self
        
        
        print("There are \(Country.countries.count) countries in our struct.")
    }


}







//Step 2: confrom to UITableViewDataSource
extension ViewController: UITableViewDataSource {
    // 2 REQUIRED METHODS
    
    //method 1: numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    //method 2: cellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeueResuableCell:
        //recycles a cell if it exists
        //if the cell does not exist a new cell is created
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        //get the object (country) at the current indexPath
        let country = countries[indexPath.row]
        
        //configure the cell
        cell.textLabel?.text = country.name

        cell.detailTextLabel?.text = country.description

//        let matrix = [[1,2,3],
//                    [4,5,6],
//                    [7,8,9]
//        ]
//
//        //matrix[indexPath.section][indexPath.row]
        //matrix[0][0]
        
        //let flatArr = [1,2,3]
        //flatArr[indexPath.row] - gets current element
        
        return cell
    }
    
}
