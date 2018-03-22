//
//  DPLayout.swift
//  DPLayout
//
//  Created by DancewithPeng on 2018/3/17.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - CGRect Utilities
public extension CGRect {
    public static func make(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public static func make(x: Double, y: Double, width: Double, height: Double) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public static func make(x: Int, y: Int, width: Int, height: Int) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public static func make(origin: CGPoint, size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    public var designScaleValue: CGRect {
        return CGRect.make(origin: origin.designScaleValue, size: size.designScaleValue)
    }
}


// MARK: - CGSize Utilities
public extension CGSize {
    public var maxLength: CGFloat {
        return width > height ? width : height
    }
    
    public var minLength: CGFloat {
        return width < height ? width : height
    }
    
    public static func make(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    public static func make(width: Double, height: Double) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    public static func make(width: Int, height: Int) -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    public var designScaleValue: CGSize {
        return CGSize.make(width: width.designScaleValue, height: height.designScaleValue)
    }
}


// MARK: - CGPoint Utilities
public extension CGPoint {
    public static func make(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public static func make(x: Double, y: Double) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public static func make(x: Int, y: Int) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public var designScaleValue: CGPoint {
        return CGPoint.make(x: x.designScaleValue, y: y.designScaleValue)
    }
}


// MARK: - CGPoint Utilities
public extension CGFloat {
    public var designScaleValue: CGFloat {
        return self * UIScreen.designScale
    }
}


// MARK: - Double Utilities
public extension Double {
    public var designScaleValue: Double {
        return self * Double(UIScreen.designScale)
    }
}


// MARK: - Int Utilities
public extension Int {
    public var designScaleValue: CGFloat {
        return CGFloat(self) * UIScreen.designScale
    }
}


// MARK: - UIScreen Utilities
public extension UIScreen {
    public static var width: CGFloat {
        return size.width
    }
    
    public static var height: CGFloat {
        return size.height
    }
    
    public static var size: CGSize {
        return main.size
    }
    
    public var size: CGSize {
        return bounds.size
    }
    
    public var width: CGFloat {
        return size.width
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    
    /// 设计图比例，默认设计图屏幕宽度为375pt
    public static var designScale: CGFloat = width / 375.0
    
    
    // 是否为异形屏幕
    public static var isIrregular: Bool {
        return Int(size.maxLength) == 812 ? true : false
    }
    
    // 是否为竖屏
    public static var isPortrait: Bool {
        return (UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait || UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portraitUpsideDown)
    }
    
    // 是否为横屏
    public static var isLandscape: Bool {
        return (UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.landscapeLeft || UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.landscapeRight)
    }
}


// MARK: - UIViewController Utilities
public extension UIViewController {

    public var safeArea: UIEdgeInsets {
        if #available(iOS 11, *) {
            if UIScreen.isIrregular {
                if isPortrait {
                    return UIEdgeInsetsMake(44, 0, 34, 0)
                } else if isLandscape {
                    if prefersHomeIndicatorAutoHidden() {
                        return UIEdgeInsetsMake(0, 44, 0, 44);
                    } else {
                        return UIEdgeInsetsMake(0, 44, 21, 44);
                    }
                } else {
                    return UIEdgeInsets.zero
                }
            } else {
                return UIEdgeInsets.zero
            }
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    public var safeAreaLayoutGuide: UILayoutGuide {
        if #available(iOS 11, *) {
            
            var layoutGuide: UILayoutGuide? = nil
            if let index = view.layoutGuides.index(where: { (inLayoutGuide) -> Bool in
                return inLayoutGuide.identifier == "DPZeroLayoutGuide"
            }) {
                layoutGuide = view.layoutGuides[index]
            } else {
                layoutGuide = UILayoutGuide()
                layoutGuide?.identifier = "DPZeroLayoutGuide"
                view.addLayoutGuide(layoutGuide!)
            }
            
            layoutGuide?.topAnchor.constraint(equalTo: view.topAnchor, constant: safeArea.top).isActive           = true
            layoutGuide?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: safeArea.left).isActive   = true
            layoutGuide?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: safeArea.right).isActive = true
            layoutGuide?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: safeArea.bottom).isActive     = true
            
            if let resultLayoutGuide = layoutGuide {
                return resultLayoutGuide;
            } else {
                return view.zeroEdgesLayoutGuide
            }
        } else {
            return view.zeroEdgesLayoutGuide
        }
    }
    
    // 是否为竖屏
    public var isPortrait: Bool {
        return UIScreen.isPortrait
    }
    
    // 是否为横屏
    public var isLandscape: Bool {
        return UIScreen.isLandscape
    }
}


// MARK: - UIView Utilities
public extension UIView {
    
    @available(iOS, introduced: 9.0, deprecated: 11.0, message: "Use view.safeAreaLayoutGuide instead of view.zeroEdgesLayoutGuide")
    /// 零边距的布局约束
    public var zeroEdgesLayoutGuide: UILayoutGuide {
        
        if let index = layoutGuides.index(where: { (layoutGuide) -> Bool in
            return layoutGuide.identifier == "DPZeroLayoutGuide"
        }) {
            return layoutGuides[index]
        } else {
            let layoutGuide = UILayoutGuide()
            layoutGuide.identifier = "DPZeroLayoutGuide"
            addLayoutGuide(layoutGuide)
            
            layoutGuide.topAnchor.constraint(equalTo: topAnchor).isActive           = true
            layoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor).isActive   = true
            layoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            layoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive     = true
            
            return layoutGuide
        }
    }
    
    /// 持有View的UIViewController，如果 UIViewController.view != self 则会返回nil
    public var ownerViewController: UIViewController? {
        if let ownerVC = next as? UIViewController, ownerVC.view == self {
            return ownerVC
        }
        
        return nil
    }
}


/// 安全区域布局指南
public class DPSafeAreaLayoutGuide: UILayoutGuide {
    
    public var topConstraint: NSLayoutConstraint?
    public var leftConstraint: NSLayoutConstraint?
    public var rightConstraint: NSLayoutConstraint?
    public var bottomConstraint: NSLayoutConstraint?
    
    public override init() {
        super.init()
        self.identifier = "DPSafeAreaLayoutGuide"
        addObserver(self, forKeyPath: "owningView", options: .new, context: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.identifier = "DPSafeAreaLayoutGuide"
        addObserver(self, forKeyPath: "owningView", options: .new, context: nil)
    }
    
    deinit {
        removeObserver(self, forKeyPath: "owningView")
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillChangeStatusBarOrientation, object: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let oView = change?[.newKey] as? UIView, oView.next is UIViewController {
            
            topConstraint = topAnchor.constraint(equalTo: oView.topAnchor, constant: 200)
            leftConstraint = leftAnchor.constraint(equalTo: oView.leftAnchor, constant: 0)
            rightConstraint = rightAnchor.constraint(equalTo: oView.rightAnchor, constant: 0)
            bottomConstraint = bottomAnchor.constraint(equalTo: oView.bottomAnchor, constant: -200)
            
            topConstraint?.isActive = true
            leftConstraint?.isActive = true
            rightConstraint?.isActive = true
            bottomConstraint?.isActive = true
            
            NotificationCenter.default.addObserver(self, selector: #selector(willChange(notifi:)), name: Notification.Name.UIApplicationWillChangeStatusBarOrientation, object: nil)
        }
    }
    
    @objc
    func willChange(notifi: Notification) {
        
        if let orientationRawValue = notifi.userInfo?[UIApplicationStatusBarOrientationUserInfoKey] as? Int {
            
            if let orientation = UIInterfaceOrientation(rawValue: orientationRawValue) {
                if orientation.isPortrait {
                    topConstraint?.constant = 100
                    leftConstraint?.constant = 0
                    rightConstraint?.constant = 0
                    bottomConstraint?.constant = -100
                } else if orientation.isLandscape {
                    topConstraint?.constant = 0
                    leftConstraint?.constant = 100
                    rightConstraint?.constant = -100
                    bottomConstraint?.constant = -21
                }
            }
        }
    }
    
    
}

class DPSystemSafeAreaLayoutGuide: DPSafeAreaLayoutGuide {
    
}

class DPOnlySafeAreaLayoutGuide: DPSafeAreaLayoutGuide {
    
}

