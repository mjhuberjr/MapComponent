//
//  AnnotationTitleView.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/13/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class AnnotationTitleView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var boxView: UIView!
    @IBOutlet var markerView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    
    private var isSelected: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupColors()
    }
    
    func configure(_ data: MapDataObject, isSelected: Bool) {
        titleLabel.text = data.title
        self.isSelected = isSelected
    }
    
    func set(_ isSelected: Bool) {
        self.isSelected = isSelected
        setupColors()
    }
    
}

// MARK: - Private methods

private extension AnnotationTitleView {
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("AnnotationTitleView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.pinToEdges(of: self)
        
        boxView.layer.cornerRadius = 2.0
        boxView.clipsToBounds = true
        markerView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        
    }
    
    func setupColors() {
        if isSelected {
            setupViews(with: UIColor(red:0.18, green:0.262, blue:0.619, alpha:1)) // FIXME: Us a themable type
        } else {
            setupViews(with: UIColor(red:0.44, green:0.60, blue:0.89, alpha:1.00)) // FIXME: Us a themable type
        }
        titleLabel.textColor = .white
    }
    
    func setupViews(with color: UIColor) {
        boxView.backgroundColor = color
        markerView.backgroundColor = color
    }
    
}
