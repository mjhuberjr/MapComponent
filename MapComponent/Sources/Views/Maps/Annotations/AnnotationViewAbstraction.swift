//
//  AnnotationViewAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

class AnnotationViewAbstraction: AnnotationViewType {
    
    var data: MapDataObject
    
    override init(annotation: AnnotationType?, reuseIdentifier: String?) {
        guard let annotation = annotation as? AnnotationAbstraction else { fatalError("Must have an Annotation Abstraction.") }
        data = annotation.data
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
