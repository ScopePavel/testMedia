//
//  MoveAssembly.swift
//
//
//  Created by Paronkin Pavel on 19/04/2020
//  Copyright © 2019 Paronkin Pavel. All rights reserved.
//

import UIKit

class MoveAssembly: NSObject {
    static func setupScene(model: Move) -> MoveViewController {
        let viewController = UIStoryboard(name: "Move", bundle: nil).instantiateViewController() as MoveViewController
        viewController.title = "Move"
        viewController.model = model
        return viewController
    }
}
