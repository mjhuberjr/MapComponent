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
    
    override init(annotation: AnnotationType?, reuseIdentifier: String?) {
        guard let annotation = annotation as? AnnotationAbstraction else { fatalError("Must have an Annotation Abstraction.") }
        data = annotation.data
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setup()
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
    
}

// MARK: - Private methods

private extension AnnotationViewAbstraction {
    
    func setup() {
        annotationTitleView = AnnotationTitleView(frame: CGRect(x: frame.origin.x - 30, y: frame.origin.y - 32, width: 60, height: 32))
        annotationTitleView.configure(data, isSelected: isSelected)
        addSubview(annotationTitleView)
    }
    
}
