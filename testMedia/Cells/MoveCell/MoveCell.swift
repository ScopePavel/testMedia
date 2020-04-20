//
//  MoveCell.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

import UIKit

//MARK: - Cell

class MoveCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var fromPlaceLabel: UILabel!
    @IBOutlet weak var toPlaceLabel: UILabel!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    
    // MARK: - Public methods
    
    static func renderCell(cell: MoveCell, model: Move) {
        cell.fromPlaceLabel.attributedText = createAttributedText(type: "fromPlace", value: model.fromPlace)
        cell.toPlaceLabel.attributedText = createAttributedText(type: "toPlace", value: model.toPlace)
        var date: Date?
        if let time = model.estimateTime {
            date = Date(timeIntervalSince1970: time)
        }
        cell.estimateTimeLabel.attributedText = createAttributedText(type: "estimateTime", value: date?.toString(format: "hh:mm dd MMM yyyy"))
    }
    
    // MARK: - Private methods
    
    static private func createAttributedText(type: String?, value: Any?) -> NSMutableAttributedString {
        var titleText: NSMutableAttributedString!
        
        if let type = type {
            titleText = NSMutableAttributedString(string: type, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)])
        } else {
            titleText = NSMutableAttributedString(string: "-", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)])
        }
        
        if let value = value {
            titleText.append(NSAttributedString(string: " \(value)" , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.blue]))
        } else {
            titleText.append(NSAttributedString(string: "-" , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.blue]))
        }
        
        return titleText
    }
    
    // MARK: - Public property
    
    // MARK: - Private property
    
    // MARK: - IBActions
}

//MARK: - ReusableView

extension MoveCell: ReusableView {}
