//
//  DetailCell.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

// MARK: - Cell

import UIKit

final class DetailCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var typeLabel: UILabel!
    
    // MARK: - Public methods
    
    static func renderCell(cell: DetailCell, model: DetailCellModel) {
        let attributedText = createAttributedText(type: model.type, value: model.value)
        cell.typeLabel.attributedText = attributedText
        
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

// MARK: - ReusableView

extension DetailCell: ReusableView {}

struct DetailCellModel {
    let type: String?
    let value: Any?
}
