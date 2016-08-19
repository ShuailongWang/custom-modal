//
//  ViewController.swift
//  自定义模态
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //懒加载
    //titleViewButton
    private lazy var titleViewButton: WSLNavTitleView = {
        let titleViewButton = WSLNavTitleView()
        
        //设置文字
        titleViewButton.setTitle("我是标题", forState: .Normal)
        
        return titleViewButton
    }()
    
    //创建模态动画的对象
    private lazy var presentedAnimation: WSLPresentedAnimation = WSLPresentedAnimation { [weak self] (isTrue) -> () in
        //设置按钮的选中状态
        self!.titleViewButton.selected = isTrue
    }
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加控件
        setupUI()
    }

    //添加控件
    private func setupUI(){
        //添加titleView
        navigationItem.titleView = titleViewButton
        
        //添加titleView的点击事件
        titleViewButton.addTarget(self, action: "clickTitleViewButton:", forControlEvents: .TouchUpInside)
    }

    //titleView的点击事件
    @objc private func clickTitleViewButton(sender: UIButton) {
        //模态
        
        //1,创建控制器
        let popoverVC = WSLPresentedController()
        
        //2,设置控制器的model样式,如果不设置的话,当前只有它自己的控制器,
        popoverVC.modalPresentationStyle = .Custom
        
        //3,设置转场的代理,并设置frame(我们只是要一个小界面)
        popoverVC.transitioningDelegate = presentedAnimation
        presentedAnimation.presentFrame = CGRect(x: 100, y: 60, width: 180, height: 250)
        
        //4,弹出控制器
        presentViewController(popoverVC, animated: true, completion: nil)
    }

}

