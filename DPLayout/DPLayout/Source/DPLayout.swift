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

public extension CGFloat {
    public var designScaleValue: CGFloat {
        return self * UIScreen.designScale
    }
}

public extension Double {
    public var designScaleValue: Double {
        return self * Double(UIScreen.designScale)
    }
}

public extension Int {
    public var designScaleValue: CGFloat {
        return CGFloat(self) * UIScreen.designScale
    }
}

public extension UIViewController {

    public var safeArea: UIEdgeInsets {
        if #available(iOS 11, *) {
            return view.safeAreaInsets
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    public var safeAreaLayoutGuide: UILayoutGuide {
        if #available(iOS 11, *) {
            return view.safeAreaLayoutGuide
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
}


