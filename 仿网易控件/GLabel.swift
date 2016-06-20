//
//  GLabel.swift
//  仿网易控件
//
//  Created by gongxiao on 16/6/16.
//  Copyright © 2016年 Gx. All rights reserved.
//

import UIKit

class GLabel: UILabel {
    var gScale: CGFloat?{
        didSet{
            let colorArray = CGColorGetComponents(defaultColor?.CGColor)
            let red = colorArray[0]
            let green = colorArray[1]
            let blue = colorArray[2]
            let selectedArray = CGColorGetComponents(selectedColor?.CGColor)
            let selectedred = selectedArray[0]
            let selectedgreen = selectedArray[1]
            let selectedblue = selectedArray[2]
            
            self.textColor = UIColor(red: red + (selectedred - red) * gScale!, green: green + (selectedgreen - green) * gScale!, blue: blue + (selectedblue - blue) * gScale!, alpha: 1)
            let transformSacle = 1 + gScale! * 0.3
            self.transform = CGAffineTransformMakeScale(transformSacle, transformSacle)
        }
    }
    private var defaultColor: UIColor?
    private var selectedColor: UIColor?

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    convenience init(frame: CGRect, normalColor: UIColor, highlitedColor: UIColor) {
        self.init(frame: frame)
        self.font = UIFont.systemFontOfSize(15)
        self.textAlignment = NSTextAlignment.Center
        self.textColor = normalColor
        self.defaultColor = normalColor
        self.selectedColor = highlitedColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
