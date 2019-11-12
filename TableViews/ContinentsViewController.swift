//
//  ContinentsViewController.swift
//  TableViews
//
//  Created by Maitree Bain on 11/12/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ContinentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var continents = [[Country]]() {
        didSet { //property observer, gets called when continents is changed or set
            tableView.reloadData() //reloads ALL the contents of the table view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        loadData()
        
    }
    func loadData() {
        continents = Country.getSections()
        //didSet will get called on continents and table view will be reloaded
    }
}


extension ContinentsViewController: UITableViewDataSource {
    //REQUIRED METHOD 1:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //the data for this table view is an array of arrays [[Country]]
        //no longer can we simply return continents.count
        //this would return 5 on our casek since we have 5 sections (continents) currently
        //we need to return the sections's count
        //[section].count on the array of arrays
        return continents[section].count
    }
    //REQUIRED METHOD 2:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: get a cell using dequeueResuableCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        //step 2: we need to get the current object at the current indexPath
        let country = continents[indexPath.section][indexPath.row]
        
        //Step 3: configure cell
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(named: "\(country.thumbnailImageName)")
        //Step 4: return cell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count //5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section].first?.continent
    }
}
