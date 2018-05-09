//
//  MapViewAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

class MapViewAbstraction: MapType {
    
    init(mapAttributes: MapAttributes, frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        setup(with: mapAttributes)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let mapAttributes = MapAttributes()
        setup(with: mapAttributes)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private methods

extension MapViewAbstraction {
    
    func setup(with mapAttributes: MapAttributes) {
        isZoomEnabled = mapAttributes.isZoomEnabled
        isScrollEnabled = mapAttributes.isScrollEnabled
        isPitchEnabled = mapAttributes.isPitchEnabled
        isRotateEnabled = mapAttributes.isRotateEnabled
    }
    
}
