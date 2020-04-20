//
//  NoticeCell.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

import UIKit

// MARK: - Cell

class NoticeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var flightDateLabel: UILabel!
    @IBOutlet weak var gateLabel: UILabel!
    
    // MARK: - Public methods
    
    static func renderCell(cell: NoticeCell, model: Notice) {
        cell.flightDateLabel.attributedText = createAttributedText(type: "flightDate", value: model.flightDate?.toString(format: "hh:mm dd MMM yyyy"))
        cell.gateLabel.attributedText = createAttributedText(type: "gate", value: model.gate)
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

extension NoticeCell: ReusableView {}
