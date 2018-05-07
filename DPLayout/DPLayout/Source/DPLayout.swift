//
//  DPLayout.swift
//  DPLayout
//
//  Created by DancewithPeng on 2018/3/17.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

// MARK: - UIEdgeInsets Layout Utilities
public extension UIEdgeInsets {
    
    /// 设计图比例值
    public var designScaleValue: UIEdgeInsets {
        return UIEdgeInsetsMake(top.designScaleValue, left.designScaleValue, bottom.designScaleValue, right.designScaleValue)
    }
}

// MARK: - CGRect Layout Utilities
public extension CGRect {
    
    /// 设计图比例值
    public var designScaleValue: CGRect {
        return CGRect(origin: origin.designScaleValue, size: size.designScaleValue)
    }
}


// MARK: - CGSize Layout Utilities
public extension CGSize {
    
    /// 设计图比例值
    public var designScaleValue: CGSize {
        return CGSize(width: width.designScaleValue, height: height.designScaleValue)
    }
    
    public var maxLength: CGFloat {
        return width > height ? width : height
    }
    
    public var minLength: CGFloat {
        return width < height ? width : height
    }
}


// MARK: - CGPoint Layout Utilities
public extension CGPoint {
    
    /// 设计图比例值
    public var designScaleValue: CGPoint {
        return CGPoint(x: x.designScaleValue, y: y.designScaleValue)
    }
}


// MARK: - CGPoint Layout Utilities
public extension CGFloat {
    public var designScaleValue: CGFloat {
        return self * UIScreen.designScale
    }
}


// MARK: - Double Layout Utilities
public extension Double {
    public var designScaleValue: Double {
        return self * Double(UIScreen.designScale)
    }
}


// MARK: - Int Layout Utilities
public extension Int {
    public var designScaleValue: CGFloat {
        return CGFloat(self) * UIScreen.designScale
    }
}


// MARK: - UIScreen Layout Utilities
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
    
    
    // 是否为异形(iPhoneX)屏幕
    public static var isIrregular: Bool {
        return Int(size.maxLength) == 812 ? true : false
    }
    
    // 是否为竖屏
    public static var isPortrait: Bool {
        return UIApplication.shared.statusBarOrientation.isPortrait
    }
    
    // 是否为横屏
    public static var isLandscape: Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
}


// MARK: - UIViewController Layout Utilities
public extension UIViewController {

    public var systemSafeArea: UIEdgeInsets {
        if #available(iOS 11, *) {
            return view.safeAreaInsets
        } else {
            return UIEdgeInsetsMake(topLayoutGuide.length, 0, 0, bottomLayoutGuide.length)
        }
    }
    
    /// 安全区域
    public var onlySafeArea: UIEdgeInsets {
        return onlySafeArea(withOrientation: UIApplication.shared.statusBarOrientation)
    }
    
    
    /// 返回ViewController的安全区域
    ///
    /// - Parameter orientation: 方向
    /// - Returns: 根据方向返回对应的安全区域
    public func onlySafeArea(withOrientation orientation: UIInterfaceOrientation) -> UIEdgeInsets {
        
        if #available(iOS 11, *) {
            if UIScreen.isIrregular {
                if orientation.isPortrait {
                    return UIEdgeInsetsMake(44, 0, 34, 0)
                } else if orientation.isLandscape {
                    if prefersHomeIndicatorAutoHidden() == true {
                        return UIEdgeInsetsMake(0, 44, 0, 44)
                    } else {
                        return UIEdgeInsetsMake(0, 44, 21, 44)
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
    
    
    // 是否为竖屏
    public var isPortrait: Bool {
        return UIScreen.isPortrait
    }
    
    
    // 是否为横屏
    public var isLandscape: Bool {
        return UIScreen.isLandscape
    }
}


// MARK: - UIView Layout Utilities
public extension UIView {
        
    /// 持有View的UIViewController，如果 UIViewController.view != self 则会返回nil
    public var ownerViewController: UIViewController? {
        if let ownerVC = next as? UIViewController, ownerVC.view == self {
            return ownerVC
        }
        
        return nil
    }
    
    /// 系统的安全区域，自动减去了状态栏、导航栏等区域
    public var systemSafeAreaLayoutGuide: UILayoutGuide {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            if let index = layoutGuides.index(where: { $0.identifier == "DPSystemSafeAreaLayoutGuide" }) {
                return layoutGuides[index]
            } else {
                
                let layoutGuide = UILayoutGuide()
                layoutGuide.identifier = "DPSystemSafeAreaLayoutGuide"
                addLayoutGuide(layoutGuide)
                
                if let ownerVC = ownerViewController {
                    layoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                    layoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                    layoutGuide.topAnchor.constraint(equalTo: ownerVC.topLayoutGuide.bottomAnchor).isActive = true
                    layoutGuide.bottomAnchor.constraint(equalTo: ownerVC.bottomLayoutGuide.topAnchor).isActive = true
                } else {
                    layoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                    layoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                    layoutGuide.topAnchor.constraint(equalTo: topAnchor).isActive = true
                    layoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
                }
                
                return layoutGuide
            }
        }
    }
    
    /// 仅仅返回异形屏(iPhoneX)的安全区域，不会自动减去状态栏、导航栏等区域
    public var onlySafeAreaLayoutGuide: UILayoutGuide {
        
        if let index = layoutGuides.index(where: { $0.identifier == "DPOnlySafeAreaLayoutGuide" }) {
            return layoutGuides[index]
        } else {
            let layoutGuide = DPOnlySafeAreaLayoutGuide()
            layoutGuide.identifier = "DPOnlySafeAreaLayoutGuide"
            addLayoutGuide(layoutGuide)
            return layoutGuide
        }
    }
    
    
    /// 是否为竖屏
    public var isPortrait: Bool {
        return UIScreen.isPortrait
    }
    
    
    /// 是否为横屏
    public var isLandscape: Bool {
        return UIScreen.isLandscape
    }
}


// MARK: - DPOnlySafeAreaLayoutGuide


/// 异形屏(iPhoneX)的安全区域
public class DPOnlySafeAreaLayoutGuide: DPSafeAreaLayoutGuide {
    
    // LayoutGuide被添加到View上时调用
    override func didAddToOwningView() {
        updateConstraintConstant(orientation: UIApplication.shared.statusBarOrientation)
    }
    
    // 屏幕方向改变时调用
    override func didChangeInterfaceOrientation(orientation: UIInterfaceOrientation) {
        updateConstraintConstant(orientation: orientation)
    }
    
    // 更新约束值
    func updateConstraintConstant(orientation: UIInterfaceOrientation) {

        if let targetSafeArea = owningView?.ownerViewController?.onlySafeArea(withOrientation: orientation) {
            topConstraint?.constant         = targetSafeArea.top
            leadingConstraint?.constant     = targetSafeArea.left
            trailingConstraint?.constant    = -targetSafeArea.right
            bottomConstraint?.constant      = -targetSafeArea.bottom
        }
    }
}


// MARK: - DPOnlySafeAreaLayoutGuide


/// 安全区域布局指南
public class DPSafeAreaLayoutGuide: UILayoutGuide {
    
    /// 顶部约束
    public var topConstraint: NSLayoutConstraint?
    /// 前部约束
    public var leadingConstraint: NSLayoutConstraint?
    /// 尾部约束
    public var trailingConstraint: NSLayoutConstraint?
    /// 底部约束
    public var bottomConstraint: NSLayoutConstraint?
    
    
    public override init() {
        super.init()
        self.identifier = "DPSafeAreaLayoutGuide"
        addObserver(self, forKeyPath: "owningView", options: .new, context: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.identifier = "DPSafeAreaLayoutGuide"
        addObserver(self, forKeyPath: "owningView", options: .new, context: nil)
    }
    
    deinit {
        removeObserver(self, forKeyPath: "owningView")
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillChangeStatusBarOrientation, object: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let oView = change?[.newKey] as? UIView, oView.next is UIViewController {
            
            topConstraint = topAnchor.constraint(equalTo: oView.topAnchor, constant: 0)
            leadingConstraint = leftAnchor.constraint(equalTo: oView.leftAnchor, constant: 0)
            trailingConstraint = rightAnchor.constraint(equalTo: oView.rightAnchor, constant: 0)
            bottomConstraint = bottomAnchor.constraint(equalTo: oView.bottomAnchor, constant: 0)
            
            topConstraint?.isActive = true
            leadingConstraint?.isActive = true
            trailingConstraint?.isActive = true
            bottomConstraint?.isActive = true
            
            NotificationCenter.default.addObserver(self, selector: #selector(statusBarOrientationwillChange(notifi:)), name: Notification.Name.UIApplicationWillChangeStatusBarOrientation, object: nil)
            
            self.didAddToOwningView()
        }
    }
    
    @objc
    func statusBarOrientationwillChange(notifi: Notification) {
        if let orientationRawValue = notifi.userInfo?[UIApplicationStatusBarOrientationUserInfoKey] as? Int {
            if let orientation = UIInterfaceOrientation(rawValue: orientationRawValue) {
                self.didChangeInterfaceOrientation(orientation: orientation)
            }
        }
    }
    
    /// LayoutGuide被添加到OwningView
    func didAddToOwningView() {
        
    }
    
    /// 界面方向改变
    func didChangeInterfaceOrientation(orientation: UIInterfaceOrientation) {
        
    }
}

