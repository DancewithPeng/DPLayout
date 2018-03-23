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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // safeArea
        testView.backgroundColor = UIColor.red
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.systemSafeAreaLayoutGuide).inset(UIEdgeInsetsMake(10, 10, 10, 10))
        }
        
        // safe Area Layout Guide: system、only
        
        // 基础工具：CGRect、CGSize、CGPoint、Int、Double、CGFloat
        
        // designScale: UIScreen design scale、design scale value
        
        // 是否为异形屏
        
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
        print("🤩🤩🤩 >> Safe Area: \(safeArea)")
    }
}

