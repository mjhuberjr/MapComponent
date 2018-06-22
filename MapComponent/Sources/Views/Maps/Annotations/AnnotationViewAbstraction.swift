//
//  AnnotationViewAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

class AnnotationViewAbstraction: AnnotationViewType {
    
    var data: MapDataObject
    var annotationTitleView: AnnotationTitleView!
    var presenter: MapComponentPresentation?
    
    override init(annotation: AnnotationType?, reuseIdentifier: String?) {
        guard let annotation = annotation as? AnnotationAbstraction else { fatalError("Must have an Annotation Abstraction.") }
        data = annotation.data
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        annotationTitleView.set(isSelected)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func provide(presenter: MapComponentPresentation) {
        self.presenter = presenter
        setup()
    }
    
}

// MARK: - Private methods

private extension AnnotationViewAbstraction {
    
    func setup() {
        guard let formatter = presenter?.dataFormatter else {
            fatalError("You have to provide a MapComponentPresentation to the AnnotationViewAbstraction")
        }
        let rect = CGRect(x: frame.origin.x, y: frame.origin.y, width: 60, height: 32)
        frame = rect
        annotationTitleView = AnnotationTitleView(frame: rect)
        annotationTitleView.provide(formatter: formatter, data: data, isSelected: isSelected)
        addSubview(annotationTitleView)
        
        offsetAnnotation()
    }
    
    func offsetAnnotation() {
        frame.origin.x -= 30
        frame.origin.y -= 32
    }
    
}
