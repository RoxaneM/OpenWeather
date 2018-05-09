//
//  NoDataView.swift
//  Quest-ios
//
//  Created by Roksana Markhyvka on 4/27/18.
//  Copyright © 2018 SecretCircle. All rights reserved.
//

import UIKit

class NoDataView: UIView {
    class func instanceFromNib() -> NoDataView {
        return UINib(nibName: "NoDataView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! NoDataView
    }

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!

    var centerYOffset: CGFloat = 0.0 {
        didSet {
            centerYConstraint.constant = centerYOffset
        }
    }

    override func awakeFromNib() {

        setupMessageLabel()
    }

    private func setupMessageLabel() {
        messageLabel.font = UIFont.Home.NoDataMessageFont
        messageLabel.textColor = UIColor.Home.NoDataMessageTextColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
    }

}
