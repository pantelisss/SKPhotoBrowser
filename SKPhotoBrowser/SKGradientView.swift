//
//  SKGradientView.swift
//  SKPhotoBrowser
//
//  Created by Pantelis Giazitsis on 29/06/2018.
//  Copyright © 2018 pantelisss. All rights reserved.
//

import UIKit

class SKGradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private

    private func setupGradient() {
        let edgeColor = SKPhotoBrowserOptions.gradientColor ?? UIColor(white: 0.0, alpha: 0.15)
        let middleColor = edgeColor.withAlphaComponent(0.0)
        let colors: [UIColor] = [edgeColor, middleColor, edgeColor]
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = [0.0, 0.5, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }

}
