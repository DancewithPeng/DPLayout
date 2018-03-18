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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print(UIScreen.screens)
        print(UIScreen.width)
        print(UIScreen.size)
        print(UIScreen.height)
        
        print(UIScreen.main.scale)
        print(UIScreen.main.nativeScale)
        print(UIScreen.designScale)
        
        let v = UIView(frame: CGRect.zero)
        v.backgroundColor = UIColor.red
        view.addSubview(v)
        
        v.snp.makeConstraints { (make) in
            make.right.equalTo(safeAreaLayoutGuide).offset(-30)
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.size.equalTo(CGSize.make(width: 300, height: 300))
        }
        
        print("--------------")
        print(view.zeroEdgesLayoutGuide)
        print("--------------")
        
        
        /*
        let block1 = UIView(frame: CGRect.zero)
        let block2 = UIView(frame: CGRect.zero)
        block1.backgroundColor = UIColor.purple
        block2.backgroundColor = UIColor.cyan
        
        view.addSubview(block1)
        view.addSubview(block2)
        
        block1.snp.makeConstraints { (make) in
//            make.left.equalTo(view).offset(30)
            make.top.equalTo(view).offset(100)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        block2.snp.makeConstraints { (make) in
//            make.right.equalTo(view).offset(-30)
            make.top.equalTo(block1)
            make.height.equalTo(block1)
            make.width.equalTo(block1)
        }
        
        let spaceLeft = UILayoutGuide()
        let spaceRight = UILayoutGuide()
        let spaceMid = UILayoutGuide()
        
        view.addLayoutGuide(spaceLeft)
        view.addLayoutGuide(spaceRight)
        view.addLayoutGuide(spaceMid)
        
        spaceLeft.widthAnchor.constraint(equalTo: spaceRight.widthAnchor).isActive = true
        spaceLeft.widthAnchor.constraint(equalTo: spaceMid.widthAnchor).isActive = true
        
        spaceLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        spaceLeft.trailingAnchor.constraint(equalTo: block1.leadingAnchor).isActive = true
        
        spaceMid.leadingAnchor.constraint(equalTo: block1.trailingAnchor).isActive = true
        spaceMid.trailingAnchor.constraint(equalTo: block2.leadingAnchor).isActive = true
        
        spaceRight.leadingAnchor.constraint(equalTo: block2.trailingAnchor).isActive = true
        spaceRight.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if UIScreen.isPortrait {
            print("竖屏")
        }
        
        if UIScreen.isLandscape {
            print("横屏")
        }
        
        if isPortrait {
            print("竖屏")
        }
        
        if isLandscape {
            print("横屏")
        }
        
        if #available(iOS 11, *) {
            print(view.zeroEdgesLayoutGuide)
            print(topLayoutGuide)
        }
        
        print(topLayoutGuide)
        
        print(safeAreaLayoutGuide)
        print("=========")
        print(view.layoutGuides)
    }
}

