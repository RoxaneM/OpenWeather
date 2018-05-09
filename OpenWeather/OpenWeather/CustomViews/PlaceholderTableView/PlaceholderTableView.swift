//
//  PlaceholderTableView.swift
//  Quest-ios
//
//  Created by Roksana Markhyvka on 4/27/18.
//  Copyright © 2018 SecretCircle. All rights reserved.
//

import UIKit

class PlaceholderTableView: UITableView {
    var placeholderMessage: String = "" {
        didSet {
            placeholderView.messageLabel.text = placeholderMessage
        }
    }

    private lazy var placeholderView: NoDataView = {
        let view = NoDataView.instanceFromNib()
        view.centerYOffset = -50.0
        view.backgroundColor = self.backgroundColor
        view.isHidden = true

        self.addSubview(view)
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableFooterView = UIView() //don't show empty rows
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        placeholderView.frame = self.bounds
    }

    override func reloadData() {
        super.reloadData()

        let hidePlaceholder = self.numberOfRows(inSection: 0) > 0
        placeholderView.isHidden = hidePlaceholder
    }

}
