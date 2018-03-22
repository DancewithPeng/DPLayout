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
    
    var topConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.完全自己布局 self.view
        // 2.systemSafeAreaLayoutGuide 包括状态栏导航栏等等
        // 3.仅仅是iPhoneX的安全区域，不包括状态栏导航栏等等 onlySafeAreaLayoutGuide
        // DPSafeAreaLayoutGuide
        
//        print(UIScreen.screens)
//        print(UIScreen.width)
//        print(UIScreen.size)
//        print(UIScreen.height)
//
//        print(UIScreen.main.scale)
//        print(UIScreen.main.nativeScale)
//        print(UIScreen.designScale)
//
//        let v = UIView(frame: CGRect.make(x: 0, y: 60, width: 100, height: 100))
//        v.backgroundColor = UIColor.red
//        view.addSubview(v)
//        let container = DPSafeAreaLayoutGuide()
//        v.tag = 1001;
//        v.translatesAutoresizingMaskIntoConstraints = false
//        view.addLayoutGuide(container)
//        
//        v.snp.makeConstraints { (make) in
//            make.edges.equalTo(container);
//        }
        
        
        
        
//        v.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
//        v.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
//        v.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
//        v.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
//
//        v.snp.makeConstraints { (make) in
//            make.right.equalTo(safeAreaLayoutGuide).offset(-30)
//            make.top.equalTo(safeAreaLayoutGuide).offset(30)
//            make.size.equalTo(CGSize.make(width: 300, height: 300))
//        }
//
//
//        print("--------------")
//        print(view.zeroEdgesLayoutGuide)
//        print("--------------")
        
        
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(test(notification:)), name: Notification.Name.UIApplicationWillChangeStatusBarOrientation, object: nil)
    }
    
    @objc func test(notification: Notification) {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            
        }
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        if UIScreen.isPortrait {
            print("||||||||||")
            topConstraint?.constant = 100
        } else {
            print("-----------")            
            topConstraint?.constant = 200
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        
    }        
    
    override func viewDidLayoutSubviews() {
        if #available(iOS 11, *) {
            print(view.safeAreaLayoutGuide)
            print(view.safeAreaLayoutGuide.topAnchor)
            print(view.safeAreaLayoutGuide.leadingAnchor)
            print(view.safeAreaLayoutGuide.bottomAnchor)
            print(view.safeAreaLayoutGuide.rightAnchor)
            
            // print(safeAreaLayoutGuide)
        }
    }
}

