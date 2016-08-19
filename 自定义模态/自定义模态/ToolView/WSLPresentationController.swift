//
//  WSLPresentationController.swift
//  自定义模态
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

class WSLPresentationController: UIPresentationController {
    //MARK: - 懒加载控件
    private lazy var coverView: UIView = UIView()   //蒙版
    
    //属性,让外面设置fram
    var myFrame: CGRect = CGRectZero
    
    //MARK: -容器将要布局子控件
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        //设置弹出view的frame
        presentedView()?.frame = myFrame
        
        //添加蒙版,点击蒙版,控制器dismis掉
        setupCoverView()
    }
}

//MARK: -设置UI界面相关
extension WSLPresentationController {
    private func setupCoverView(){
        //添加蒙版
        containerView?.insertSubview(coverView, atIndex: 0)
        
        //设置蒙版的属性
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)     //背景颜色
        coverView.frame = containerView!.bounds                         //大小
        
        //添加手势
        let tap = UITapGestureRecognizer(target: self, action: "clickCoverView")
        coverView.addGestureRecognizer(tap)
    }
}

//MARK: -事件监听
extension WSLPresentationController {
    //手势
    @objc private func clickCoverView(){
        //获取当前控制器,然后dismis
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
