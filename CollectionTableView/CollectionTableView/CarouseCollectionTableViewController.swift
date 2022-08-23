//
//  ViewController.swift
//  CollectionTableView
//
//  Created by Junseo Park on 2022/08/18.
//

import UIKit

// MARK:  - Carouse collection view inside talbe view (MVVM)

class CarouseCollectionTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - TableView
    
    // closure parttern
    // () parameter
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        // register new cell
        // self: reference the type object
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        return tableView
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionCellViewModel(name: "Red", backgroundColor: .systemRed),
                TileCollectionCellViewModel(name: "Orange", backgroundColor: .systemOrange),
                TileCollectionCellViewModel(name: "Yellow", backgroundColor: .systemYellow),
                TileCollectionCellViewModel(name: "Green", backgroundColor: .systemGreen),
                TileCollectionCellViewModel(name: "Blue", backgroundColor: .systemBlue),
                TileCollectionCellViewModel(name: "Purple", backgroundColor: .systemPurple),
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // frame: the view’s location and size in its superview’s coordinate system.
        // bound: the view’s location and size in its own coordinate system.
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Table view data source object
    
    // Reporting the number of sections and rows in the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    // Providing cells for each row of the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2 
     }
    
}

extension CarouseCollectionTableViewController: CollectionTableViewCellDelegate {
    func collectionTableViewTapIteom(with viewModel: TileCollectionCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "Success", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
