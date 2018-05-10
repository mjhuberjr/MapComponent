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
    var interactor: MapInteraction
    
    // Layout properties
    private var orientation: UIInterfaceOrientation!
    
    // MARK: - Initialization
    
    init(presenter: MapComponentPresentation) {
        self.presenter = presenter
        self.mapView.presenter = presenter
        
        let interactor = MapInteractor(presenter: presenter, mapView: mapView)
        self.interactor = interactor
        
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
        let delegate = MapAbstractionDelegate(mapConfiguration: presenter.mapConfiguration)
        mapView.configure(presenter, delegate: delegate)
    }
    
    @objc func reframeMapView() {
        if orientation == UIApplication.shared.statusBarOrientation {
            return
        } else {
            orientation = UIApplication.shared.statusBarOrientation
        }
        
        let selectedObject = presenter.selectedObject
        interactor.focus(on: selectedObject)
    }
    
}
