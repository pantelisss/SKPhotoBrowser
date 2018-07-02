//
//  SKButtons.swift
//  SKPhotoBrowser
//
//  Created by 鈴木 啓司 on 2016/08/09.
//  Copyright © 2016年 suzuki_keishi. All rights reserved.
//

import Foundation

// helpers which often used
private let bundle = Bundle(for: SKPhotoBrowser.self)

class SKButton: UIButton {
    static let defaultSize: CGSize = CGSize(width: 44.0, height: 44.0)
    internal var showFrame: CGRect!
    internal var hideFrame: CGRect!
    
    fileprivate var marginX: CGFloat = 0
    fileprivate var marginY: CGFloat = 0
    fileprivate var extraMarginY: CGFloat = SKMesurement.isPhoneX ? 10 : 0
    
    func setup(_ imageName: String) {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = true
        autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin]
        
        let image = UIImage(named: "SKPhotoBrowser.bundle/images/\(imageName)", in: bundle, compatibleWith: nil) ?? UIImage()
        setImage(image, for: UIControlState())
    }
  
    func setFrameSize(_ size: CGSize? = nil) {
        guard let size = size else { return }
        
        let newRect = CGRect(x: marginX, y: marginY, width: size.width, height: size.height)
        frame = newRect
        showFrame = newRect
        hideFrame = CGRect(x: marginX, y: -marginY, width: size.width, height: size.height)
    }
    
    func updateFrame(_ frameSize: CGSize) { }
}

class SKImageButton: SKButton {
    fileprivate var imageName: String { return "" }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(imageName)
        showFrame = CGRect(x: marginX, y: marginY, width: bounds.size.width, height:  bounds.size.height)
        hideFrame = CGRect(x: marginX, y: -marginY, width: bounds.size.width, height: bounds.size.height)
    }
}

class SKCloseButton: SKImageButton {
    override var imageName: String { return "btn_common_close_wh" }
    override var marginX: CGFloat {
        get {
            return SKPhotoBrowserOptions.swapCloseAndDeleteButtons
                ? SKMesurement.screenWidth - SKButtonOptions.closeButtonPadding.x - bounds.size.width
                : SKButtonOptions.closeButtonPadding.x
        }
        set { super.marginX = newValue }
    }
    override var marginY: CGFloat {
        get { return SKButtonOptions.closeButtonPadding.y + extraMarginY }
        set { super.marginY = newValue }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(imageName)
        showFrame = CGRect(x: marginX, y: marginY, width: bounds.size.width, height: bounds.size.height)
        hideFrame = CGRect(x: marginX, y: -marginY, width: bounds.size.width, height: bounds.size.height)
    }
}

class SKDeleteButton: SKImageButton {
    override var imageName: String { return "btn_common_delete_wh" }
    override var marginX: CGFloat {
        get {
            return SKPhotoBrowserOptions.swapCloseAndDeleteButtons
                ? SKButtonOptions.deleteButtonPadding.x
                : SKMesurement.screenWidth - SKButtonOptions.deleteButtonPadding.x - bounds.size.width
        }
        set { super.marginX = newValue }
    }
    override var marginY: CGFloat {
        get { return SKButtonOptions.deleteButtonPadding.y + extraMarginY }
        set { super.marginY = newValue }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(imageName)
        showFrame = CGRect(x: marginX, y: marginY, width: bounds.size.width, height: bounds.size.height)
        hideFrame = CGRect(x: marginX, y: -marginY, width: bounds.size.width, height: bounds.size.height)
    }
}
