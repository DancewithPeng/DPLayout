//
//  ViewController.swift
//  DPLayoutExample
//
//  Created by DancewithPeng on 2018/3/17.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit
import DPLayout
import SnapKit

class ViewController: UIViewController {
    
    lazy var testView = UIView(frame: CGRect.zero)
    lazy var testView2 = UIView(frame: CGRect.zero)
    lazy var testView3 = UIView(frame: CGRect.zero)
    lazy var testView4 = UIView(frame: CGRect.make(x: 60, y: 60, width: 305, height: 305).designScaleValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        testView3.backgroundColor = UIColor.yellow
        view.addSubview(testView3)
        testView3.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        // Safe Area Layout Guide
        testView2.backgroundColor = UIColor.blue
        view.addSubview(testView2)
        testView2.snp.makeConstraints { (make) in
            make.edges.equalTo(view.onlySafeAreaLayoutGuide)
        }
        
        testView.backgroundColor = UIColor.red
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.systemSafeAreaLayoutGuide).inset(UIEdgeInsetsMake(20, 20, 20, 20).designScaleValue)
        }
        
        testView4.backgroundColor = UIColor.purple
        view.addSubview(testView4)
        
        // 基础工具：CGRect、CGSize、CGPoint、Int、Double、CGFloat
        
        
        // designScale: UIScreen design scale、design scale value
        
        // 是否为异形屏
        if UIScreen.isIrregular {
            print("😍😍😍 >> 异形屏幕")
        } else {
            print("😍😍😍 >> 非异形屏幕")
        }
        
        // 屏幕方向
    }
    

    // 是否自动隐藏Home指示器
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 页面布局完成
    override func viewDidLayoutSubviews() {
        
        // Safe Area
        print("🤩🤩🤩 >> System Safe Area: \(systemSafeArea)")
        print("😎😎😎 >> Only Safe Area: \(onlySafeArea)")
        
        if isPortrait {
            print("😇😇😇 >> 竖屏")
        }
        
        if isLandscape {
            print("😇😇😇 >> 横屏")
        }
    }
}

