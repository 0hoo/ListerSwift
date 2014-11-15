//
//  ListColorCell.swift
//  ListerSwift
//
//  Created by Young Hoo Kim on 11/14/14.
//  Copyright (c) 2014 Young Hoo Kim. All rights reserved.
//

import UIKit

class ListColorCell: UITableViewCell {
    
    var colorView: UIView
    var nameLabel: UILabel
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        colorView = UIView()
        colorView.setTranslatesAutoresizingMaskIntoConstraints(false)
        nameLabel = UILabel()
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(colorView)
        self.contentView.addSubview(nameLabel)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let viewsDictionary = ["colorView": colorView, "nameLabel": nameLabel]
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-(0)-[colorView(20)]-[nameLabel]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary))
        self.contentView.addConstraint(NSLayoutConstraint(item: colorView, attribute:NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: colorView, attribute:NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: nameLabel, attribute:NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func configure(list:List) {
        self.colorView.backgroundColor = list.color
        self.nameLabel.text = list.name
    }
}