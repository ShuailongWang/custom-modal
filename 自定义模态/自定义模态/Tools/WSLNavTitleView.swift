//
//  WSLNavTitleView.swift
//  自定义模态
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

class WSLNavTitleView: UIButton {

    //重写init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置图片,选中和默认
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        
        //设置标题颜色,默认是白色的
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        //设置大小,不设置的话,图片显示不出来
        sizeToFit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //交换文字跟图片的位置
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.frame.size.width)! + 5
        
    }

}
