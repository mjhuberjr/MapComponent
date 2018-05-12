//
//  UIViewController+Embed.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/11/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embed(_ vc: UIViewController) {
        vc.view.frame = self.view.bounds
        vc.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addChildViewController(vc)
        view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
    
}
