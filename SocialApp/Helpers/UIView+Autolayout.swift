//
//  UIView+Autolayout.swift
//
//  Created by KOLOVATOV Aleksandr on 14.06.2023.
//

import UIKit

extension UIView {
    enum Side {
        case left
        case right
        case top
        case bottom
        case all
    }

    func placed(on view: UIView) {
        view.addSubview(self)
    }

    func pinEdges(to view: UIView, insets: UIEdgeInsets = .zero, excluding side: Side = .all) {
        switch side {
            case .all:
                pinTop(to: view, inset: insets.top)
                pinBottom(to: view, inset: insets.bottom)
                pinLeading(to: view, inset: insets.left)
                pinTrailing(to: view, inset: insets.right)
            case .left:
                pinTop(to: view, inset: insets.top)
                pinBottom(to: view, inset: insets.bottom)
                pinTrailing(to: view, inset: insets.right)
            case .right:
                pinTop(to: view, inset: insets.top)
                pinBottom(to: view, inset: insets.bottom)
                pinLeading(to: view, inset: insets.left)
            case .top:
                pinBottom(to: view, inset: insets.bottom)
                pinLeading(to: view, inset: insets.left)
                pinTrailing(to: view, inset: insets.right)
            case .bottom:
                pinTop(to: view, inset: insets.top)
                pinLeading(to: view, inset: insets.left)
                pinTrailing(to: view, inset: insets.right)
        }
    }

    @discardableResult
    func pinTop(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: view.topAnchor, constant: inset)
    }

    @discardableResult
    func pinTop(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: anchor, constant: inset)
    }

    @discardableResult
    func pinBottom(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset)
    }

    @discardableResult
    func pinBottom(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: anchor, constant: -inset)
    }

    @discardableResult
    func pinLeading(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset)
    }

    @discardableResult
    func pinLeading(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: anchor, constant: inset)
    }

    @discardableResult
    func pinTrailing(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset)
    }

    @discardableResult
    func pinTrailing(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: anchor, constant: -inset)
    }

    func pinCenter(to view: UIView, insetX: CGFloat = .zero, insetY: CGFloat = .zero) {
        pinCenterX(to: view, inset: insetX)
        pinCenterY(to: view, inset: insetY)
    }

    @discardableResult
    func pinCenterX(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: inset)
    }

    @discardableResult
    func pinCenterY(to view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: inset)
    }

    @discardableResult
    func pinHeight(equalTo: NSLayoutDimension, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalTo: equalTo, multiplier: multiplier, constant: constant)
    }

    @discardableResult
    func pinHeight(equalTo view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: multiplier,
            constant: constant
        )
    }

    @discardableResult
    func pinHeight(equalTo constant: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalToConstant: constant)
    }

    @discardableResult
    func pinWidth(constant: CGFloat, multiplier: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalToConstant: constant)
    }
    
    @discardableResult
    func cornerRadius(cornerRadius: CGFloat = 16) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func forAutolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

extension NSLayoutConstraint {
    @discardableResult
    func activated() -> Self {
        isActive = true
        return self
    }
}
