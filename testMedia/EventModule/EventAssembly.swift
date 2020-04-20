//
//  EventAssembly.swift
//  
//
//  Created by Paronkin Pavel on 19/04/2020
//  Copyright © 2019 Paronkin Pavel. All rights reserved.
//

import UIKit

class EventAssembly: NSObject {
    static func setupScene(model: Event) -> EventViewController {
        let viewController = UIStoryboard(name: "Event", bundle: nil).instantiateViewController() as EventViewController
        viewController.title = "Event"
        viewController.model = model
        return viewController
    }
}
