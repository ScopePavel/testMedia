//
//  NoticeAssembly.swift
//  
//
//  Created by Paronkin Pavel on 19/04/2020
//  Copyright © 2019 Paronkin Pavel. All rights reserved.
//

import UIKit

class NoticeAssembly: NSObject {
    static func setupScene(model: Notice) -> NoticeViewController {
        let viewController = UIStoryboard(name: "Notice", bundle: nil).instantiateViewController() as NoticeViewController
        viewController.title = "Notice"
        viewController.model = model
        return viewController
    }
}
