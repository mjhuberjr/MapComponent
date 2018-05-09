//
//  MapRootViewController.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

class MapRootViewController: UIViewController {
    
    @IBOutlet var mapView: MapAbstraction!
    
    private var presenter: MapComponentPresentation
    
    // Layout properties
    private var orientation: UIInterfaceOrientation!
    
    // MARK: - Initialization
    
    init(presenter: MapComponentPresentation) {
        self.presenter = presenter
        self.mapView.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: MapRootViewController.self))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orientation = UIApplication.shared.statusBarOrientation
        setupMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(reframeMapView), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
}

// MARK: - Private methods

private extension MapRootViewController {
    
    func setupMapView() {
        mapView.configure(presenter)
    }
    
    @objc func reframeMapView() {
        if orientation == UIApplication.shared.statusBarOrientation {
            return
        } else {
            orientation = UIApplication.shared.statusBarOrientation
        }
        
        let offset = presenter.mapConfiguration.offset
        focusMap(with: offset)
    }
    
    func focusMap(with offset: CGPoint) {
        // Center the map
    }
    
}
