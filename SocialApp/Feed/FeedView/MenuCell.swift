//
//  MenuCell.swift
//  SocialApp
//
//  Created by Олеся on 22.06.2023.
//

import UIKit

class MenuCell: UITableViewCell {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.forAutolayout()
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.addTarget(self, action: #selector(doSomething), for: .touchUpInside)
        return button
    }()

    private var constraintsForButton: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func doSomething() {
        print("buttonTapped")
    }

    private func layout() {
        contentView.addSubview(button)
        constraintsForButton.append(contentsOf: [
            
            button.pinHeight(equalTo: 44),
            button.pinTop(to: contentView.topAnchor),
            button.pinBottom(to: contentView.bottomAnchor),
            button.pinLeading(to: contentView.leadingAnchor),
 ]
)
        NSLayoutConstraint.activate(constraintsForButton)
    }

    func conigure(action: String) {
        button.setTitle(action, for: .normal)
    }
}
