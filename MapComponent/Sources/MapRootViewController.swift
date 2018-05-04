//
//  MapRootViewController.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

class MapRootViewController: UIViewController {
    
    @IBOutlet weak var mapView: MapAbstraction!
    
    private var presenter: MapComponentPresentation
    
    // Layout properties
    private var orientation: UIInterfaceOrientation!
    
    // MARK: - Initialization
    
    init(presenter: MapComponentPresentation) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
}
