//
//  ViewController.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    private var models: [ModelTypeProtocol] = []
    
    // MARK: - IBActions
    
    @IBAction func generateAction(_ sender: UIBarButtonItem) {
        generateData()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailCell.self)
        generateData()
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    private func generateData() {
        models = []
        let count = Int.random(in: 20...100)
        for _ in 1...count {
            
            let type = Int.random(in: 0...2)
            switch type {
            case 0:
                let event = ModelGenerator.generateEvent()
                models.append(event)
            case 1:
                let move = ModelGenerator.generateMove()
                models.append(move)
            case 2:
                let notice = ModelGenerator.generateNotice()
                models.append(notice)
            default:
                break
            }
            
        }
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cellModel = models[safe: indexPath.row] {
            switch cellModel.type {
            case .event:
                let eventModel = cellModel as! Event
                pushToScene(EventAssembly.setupScene(model: eventModel))
            case .move:
                let moveModel = cellModel as! Move
                pushToScene(MoveAssembly.setupScene(model: moveModel))
            case .notice:
                let noticeModel = cellModel as! Notice
                pushToScene(NoticeAssembly.setupScene(model: noticeModel))
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cellModel = models[safe: indexPath.row] {
            switch cellModel.type {
            case .event:
                let eventModel = cellModel as! Event
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
                DetailCell.renderCell(cell: cell, model: DetailCellModel(type: "Event", value: eventModel.name))
                return cell
            case .move:
                let moveModel = cellModel as! Move
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
                DetailCell.renderCell(cell: cell, model: DetailCellModel(type: "Move", value: moveModel.fromPlace))
                return cell
            case .notice:
                let noticeModel = cellModel as! Notice
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
                DetailCell.renderCell(cell: cell, model: DetailCellModel(type: "Notice", value: noticeModel.gate))
                return cell
            }
        }
        
        return UITableViewCell()
    
    }
    
}

// MARK: - ModuleRoutingProtocol

extension ViewController: ModuleRoutingProtocol {
    
    func presentScene(_ scene: UIViewController) {
        self.present(scene, animated: true, completion: nil)
    }
    
    func pushToScene(_ scene: UIViewController) {
        self.navigationController?.pushViewController(scene, animated: true)
    }
    
}

