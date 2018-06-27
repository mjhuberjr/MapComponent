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
    
    func provide(formatter: MapDataFormattable, data: MapDataObject, isSelected: Bool) {
        titleLabel.text = isSelected
            ? formatter.formatTitleSelected(for: data)
            : formatter.formatTitle(for: data)
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
        
        boxView.layer.cornerRadius = 6.0
        boxView.clipsToBounds = true
        
        markerView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        markerView.layer.cornerRadius = 2.0
        markerView.clipsToBounds = true
        
    }
    
    func setupColors() {
        if isSelected {
            setupViews(with: Themeable.shared.activeColor)
        } else {
            setupViews(with: Themeable.shared.primaryColor)
        }
        titleLabel.textColor = Themeable.shared.primaryTextColor
    }
    
    func setupViews(with color: UIColor) {
        boxView.backgroundColor = color
        markerView.backgroundColor = color
    }
    
}
