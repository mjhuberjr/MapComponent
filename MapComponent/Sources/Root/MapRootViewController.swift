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
    var interactor: MapInteraction!
    
    // Layout properties
    private var orientation: UIInterfaceOrientation!
    
    // MARK: - Initialization
    
    init(presenter: MapComponentPresentation) {
        self.presenter = presenter
        
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
        setupInteractor()
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
    
    func setupInteractor() {
        let interactor = MapInteractor(presenter: presenter, mapView: mapView)
        self.interactor = interactor
    }
    
    func setupMapView() {
        let delegate = MapAbstractionDelegate(interactor: interactor, presenter: presenter, mapConfiguration: presenter.mapConfiguration)
        mapView.configure(presenter, delegate: delegate)
        
        centerMap()
    }
    
    func centerMap() {
        let dataObjects = presenter.dataSource.mapDataObjects
        guard let identifier = dataObjects.first?.id else { return }
        interactor.selectAnnotation(with: identifier)
    }
    
    @objc func reframeMapView() {
        if orientation == UIApplication.shared.statusBarOrientation {
            return
        } else {
            orientation = UIApplication.shared.statusBarOrientation
        }
        
        let selectedObject = presenter.selectedObject
        let coordinate = selectedObject?.coordinate
        interactor.focus(on: coordinate)
    } 
    
}
