//
//  AnyUtils.swift
//  testMedia
//
//  Created by Pavel Scope on 19.04.2020.
//  Copyright © 2020 Paronkin Pavel. All rights reserved.
//

import UIKit

protocol ModuleRoutingProtocol: NSObjectProtocol {
    func pushToScene(_ scene: UIViewController)
    func presentScene(_ scene: UIViewController)
}


protocol ReusableView: class {}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableView { }

extension UITableView {
    func dequeueReusableCell<T>() -> T where T: ReusableView {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        
    }
    
}

extension UIStoryboard {
    func instantiateViewController<T>() -> T where T: ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func getFrom(hour: Int, minute: Int, second: Int) -> Date? {
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: self)
    }
    
    func toInt() -> Int {
        let someDate = self
        let timeInterval = someDate.timeIntervalSince1970
        return Int(timeInterval)
    }
    
}
