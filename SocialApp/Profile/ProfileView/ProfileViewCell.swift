//
//  ProfileViewCell.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class ProfileViewCell: UITableViewCell {
    private enum Constants {
        static let sideInset: CGFloat = 16
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
