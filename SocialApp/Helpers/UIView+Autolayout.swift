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

    func pinTop(to view: UIView, inset: CGFloat = .zero) {
        topAnchor.constraint(equalTo: view.topAnchor, constant: inset).activated()
    }

    func pinTop(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero) {
        topAnchor.constraint(equalTo: anchor, constant: inset).activated()
    }

    func pinBottom(to view: UIView, inset: CGFloat = .zero) {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset).activated()
    }

    func pinLeading(to view: UIView, inset: CGFloat = .zero) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).activated()
    }

    func pinTrailing(to view: UIView, inset: CGFloat = .zero) {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset).activated()
    }

    func pinCenter(to view: UIView, insetX: CGFloat = .zero, insetY: CGFloat = .zero) {
        pinCenterX(to: view, inset: insetX)
        pinCenterY(to: view, inset: insetY)
    }

    func pinCenterX(to view: UIView, inset: CGFloat = .zero) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: inset).activated()
    }

    func pinCenterY(to view: UIView, inset: CGFloat = .zero) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: inset).activated()
    }

    func pinHeight(constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).activated()
    }

    func pinWidth(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).activated()

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
