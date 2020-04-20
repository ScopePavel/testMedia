//
//  EventViewController.swift
//
//
//  Created by Paronkin Pavel on 19/04/2020
//  Copyright © 2019 Paronkin Pavel. All rights reserved.
//

import UIKit

final class EventViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    var model: Event? = nil
    
    // MARK: - Private Properties
    
    // MARK: - IBActions
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    private func createTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventCell.self)
    }
    
}

// MARK: - UITableViewDelegate

extension EventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension EventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = model {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
            EventCell.renderCell(cell: cell, model: model)
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - ModuleRoutingProtocol

extension EventViewController: ModuleRoutingProtocol {
    
    func presentScene(_ scene: UIViewController) {
        self.present(scene, animated: true, completion: nil)
    }
    
    func pushToScene(_ scene: UIViewController) {
        self.navigationController?.pushViewController(scene, animated: true)
    }
    
}
