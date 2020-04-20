//
//  NoticeViewController.swift
//
//
//  Created by Paronkin Pavel on 19/04/2020
//  Copyright © 2019 Paronkin Pavel. All rights reserved.
//

import UIKit

final class NoticeViewController: UIViewController{
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    var model: Notice? = nil
    
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
        tableView.register(NoticeCell.self)
    }
    
}

// MARK: - UITableViewDelegate

extension NoticeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension NoticeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = model {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeCell
            NoticeCell.renderCell(cell: cell, model: model)
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - ModuleRoutingProtocol

extension NoticeViewController: ModuleRoutingProtocol {
    
    func presentScene(_ scene: UIViewController) {
        self.present(scene, animated: true, completion: nil)
    }
    
    func pushToScene(_ scene: UIViewController) {
        self.navigationController?.pushViewController(scene, animated: true)
    }
    
}
