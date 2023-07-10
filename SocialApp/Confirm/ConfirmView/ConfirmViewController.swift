//
//  ConfirmViewController.swift
//  SocialApp
//
//  Created by Олеся on 18.06.2023.
//

import UIKit

class ConfirmViewController: UIViewController {
    private enum Constants {
        static let sideInset: CGFloat = 16
    }
    private let viewModel = ConfirmControllerViewModel()

    private let confirmLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let sentCodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let badge: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private lazy var phoneNumberField: UITextField = {
        let field = UITextField()
        return field
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
                self.buttonTapped()
            }
        )
        button.cornerRadius()
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .disabled)
        return button
    }()

    private let readyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var commonConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setColor()
        setUpTextField()
        configureView(with: viewModel)
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.left")
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backItemAction)), animated: true)
    }

    // MARK: - Helpers

    private func addSubviews() {
        [confirmLabel, sentCodeLabel, numberLabel, badge, phoneNumberField, registrationButton, readyImage].forEach({$0.forAutolayout()})
        [confirmLabel, sentCodeLabel, numberLabel, badge, phoneNumberField, registrationButton, readyImage].forEach({$0.placed(on: view)})
    }

    private func configureView(with viewModel: ConfirmControllerViewModel){
        [confirmLabel, sentCodeLabel, numberLabel].forEach({$0.textAlignment = viewModel.centerText})
        [confirmLabel, numberLabel].forEach({$0.font = viewModel.boldFont})
        confirmLabel.text = viewModel.confirmLabelTitle
        confirmLabel.textColor = viewModel.orangeColor
        sentCodeLabel.text = viewModel.pushNumberUserTitle
        sentCodeLabel.font = viewModel.regularFont
        sentCodeLabel.textColor = viewModel.grayColor
        numberLabel.text = viewModel.numberLabelTitle
        numberLabel.textColor = .darkGray
        badge.text = viewModel.badgeText
        badge.font = viewModel.badgeFont
        badge.textColor = viewModel.lightGray
        badge.textAlignment = viewModel.leftText
        registrationButton.setTitle(viewModel.buttonTitle, for: .normal)
        readyImage.image = viewModel.readyImage
    }

    private func setUpTextField() {
        phoneNumberField.delegate = self
        phoneNumberField.textAlignment = viewModel.centerText
        phoneNumberField.cornerRadius()
        phoneNumberField.layer.borderWidth = 0.8
        phoneNumberField.layer.borderColor = viewModel.blackColor.cgColor
        phoneNumberField.keyboardType = .phonePad
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        phoneNumberField.attributedPlaceholder = NSAttributedString(
            string:viewModel.placeholderString,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        phoneNumberField.clearButtonMode = .whileEditing
    }

    private func buttonTapped() {
        let confirmViewController = MainTabBarController()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.setViewControllers([confirmViewController], animated: false)
    }

    @objc private func backItemAction(){
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension ConfirmViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                numberLabel.pinTop(to: sentCodeLabel.bottomAnchor),

                badge.pinLeading(to: phoneNumberField.leadingAnchor),
                badge.pinBottom(to: phoneNumberField.topAnchor),

                phoneNumberField.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                registrationButton.pinHeight(equalTo: 44),
                registrationButton.pinLeading(to: phoneNumberField.leadingAnchor),
                registrationButton.pinTrailing(to: phoneNumberField.trailingAnchor),
            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                confirmLabel.pinTop(to: view, inset: Constants.sideInset * 2),
                confirmLabel.pinLeading(to: phoneNumberField.leadingAnchor),
                confirmLabel.pinTrailing(to: view.trailingAnchor, inset: Constants.sideInset),

                sentCodeLabel.pinTop(to: confirmLabel.bottomAnchor, inset: Constants.sideInset * 2),
                sentCodeLabel.pinLeading(to: phoneNumberField.leadingAnchor),
                sentCodeLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                phoneNumberField.pinHeight(equalTo: 44),
                phoneNumberField.pinTop(to: numberLabel.bottomAnchor, inset: 24),
                phoneNumberField.pinLeading(to: readyImage.trailingAnchor, inset: Constants.sideInset),

                numberLabel.pinLeading(to: readyImage.trailingAnchor, inset: Constants.sideInset),
                numberLabel.pinTrailing(to: phoneNumberField.trailingAnchor, inset: Constants.sideInset),

                registrationButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 56),

                readyImage.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor,inset: Constants.sideInset),
                readyImage.pinTop(to: confirmLabel.topAnchor),
                readyImage.pinBottom(to: view.bottomAnchor, inset: Constants.sideInset),
                readyImage.pinWidth(equalTo: UIScreen.main.bounds.width / 2)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                confirmLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 80),
                confirmLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                confirmLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                sentCodeLabel.pinTop(to: confirmLabel.bottomAnchor, inset: Constants.sideInset),
                sentCodeLabel.pinLeading(to: confirmLabel.leadingAnchor),
                sentCodeLabel.pinTrailing(to: confirmLabel.trailingAnchor),

                numberLabel.pinTop(to: sentCodeLabel.bottomAnchor),
                numberLabel.pinLeading(to: sentCodeLabel.leadingAnchor),

                phoneNumberField.pinHeight(equalTo: 56),
                phoneNumberField.pinTop(to: numberLabel.bottomAnchor, inset: 56),
                phoneNumberField.pinLeading(to: numberLabel.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinTrailing(to: numberLabel.trailingAnchor, inset: Constants.sideInset),

                registrationButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100),
                registrationButton.pinLeading(to: phoneNumberField.leadingAnchor),
                registrationButton.pinTrailing(to: phoneNumberField.trailingAnchor),
                readyImage.pinTop(to: registrationButton.bottomAnchor, inset: 32),
                readyImage.pinLeading(to: registrationButton.leadingAnchor),
                readyImage.pinTrailing(to: registrationButton.trailingAnchor),
                readyImage.pinHeight(equalTo: 200)
            ]
        )

        if Orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
        NSLayoutConstraint.activate(commonConstraints)
    }
}

// MARK: - View Will Transition

extension ConfirmViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate { _ in
            if UIDevice.current.orientation.isLandscape {
                NSLayoutConstraint.deactivate(self.portraitConstraints)
                NSLayoutConstraint.activate(self.landscapeConstraints)
            } else {
                NSLayoutConstraint.deactivate(self.landscapeConstraints)
                NSLayoutConstraint.activate(self.portraitConstraints)
            }
        }
    }
}

extension ConfirmViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        registrationButton.tintColor = .contentColor
    }
}

extension ConfirmViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return  false}
        textField.text = text.applyPatternOnNumbers(pattern: "###-##-##", replacementCharacter: "#")
        let newLength = text.count
        return newLength <= 8
    }
}
