//
//  CheckBoxCell.swift
//  ListerSwift
//
//  Created by Young Hoo Kim on 11/14/14.
//  Copyright (c) 2014 Young Hoo Kim. All rights reserved.
//

import UIKit

class CheckBoxCell: UITableViewCell {
    var label: UILabel
    var checkBox: CheckBox
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        checkBox = CheckBox()
        checkBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        checkBox.strokeFactor = 0.068359375
        checkBox.insetFactor = 0.171875
        checkBox.markInsetFactor = 0.34
        checkBox.backgroundColor = UIColor.whiteColor()
        checkBox.tintColor = UIColor.darkGrayColor()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        self.contentView.addSubview(checkBox)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let viewsDictionary = ["label": label, "checkBox": checkBox]
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[checkBox(20)]-[label]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary))
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[checkBox(20)]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary))
        self.contentView.addConstraint(NSLayoutConstraint(item: checkBox, attribute:NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: label, attribute:NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func configure(listItem:ListItem) {
        self.checkBox.isChecked = listItem.isComplete
        self.label.text = listItem.text
    }
}