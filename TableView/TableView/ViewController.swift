//
//  ViewController.swift
//  TableView
//
//  Created by Junseo Park on 2022/08/18.
//

import UIKit

// MARK:  - TableView as code

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - TableView
    
    // closure parttern
    // () parameter
    private let tableView: UITableView = {
        let table = UITableView()
        
        // register new cell
        // self: reference the type object
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Table view data source object
    
    // Reporting the number of sections and rows in the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    // Providing cells for each row of the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure content
        // Similar View - ViewModel arhitecture
        var content = cell.defaultContentConfiguration()
        content.text = "alarm  tableView: \(indexPath.row)"
        content.image = UIImage(systemName: "bell")
         
        // Customize appearence
        cell.contentConfiguration = content
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

