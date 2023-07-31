//
//  EnterNumberViewController.swift
//  SocialApp
//
//  Created by Олеся on 18.06.2023.
//

import UIKit

final class EnterPhoneNumberViewController: UIViewController {

    private var viewModel: EnterPhoneNumberViewModel?

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.cornerRadius()
        return label
    }()

    private let pushNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let secondLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.cornerRadius()
        return label
    }()

    private lazy var phoneNumberField: UITextField = {
        let field = UITextField().forAutolayout()
        field.cornerRadius()
        field.layer.borderWidth = 1
        field.layer.borderColor = AppColors.black.cgColor
        field.keyboardType = .phonePad
        field.textAlignment = .center
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        field.attributedPlaceholder = NSAttributedString(
            string: viewModel?.placeholderString ?? "",
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        field.delegate = self
        field.clearButtonMode = .always
        return field
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
                self.registrationButtonTapped()
            }
        )
        button.cornerRadius()
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .disabled)
        return button
    }()

    private let privacyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()

    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var commonConstraints: [NSLayoutConstraint] = []

    init(with viewModel: EnterPhoneNumberViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stateViewModel(state: .viewIsReady)
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: IconsName.leftArrow.nameIcon)
        navigationItem.setLeftBarButton(
            UIBarButtonItem(
                image: UIImage(systemName: IconsName.leftArrow.nameIcon),
                style: .plain,
                target: self,
                action: #selector(backItemAction)
            ),
            animated: true
        )
        phoneNumberField.text = ""
    }

    // MARK: - Helpers

    private func addSubviews() {
        [
            welcomeLabel, pushNumberLabel, secondLabel,
            phoneNumberField, confirmButton, privacyLabel
        ].forEach({$0.forAutolayout()})
        [
            welcomeLabel, pushNumberLabel, secondLabel,
            phoneNumberField, confirmButton, privacyLabel
        ].forEach({$0.placed(on: view)})
    }

    private func configure() {
        welcomeLabel.text = viewModel?.welcomeLabelTitle
        pushNumberLabel.text = viewModel?.pushNumberUserTitle
        secondLabel.text = viewModel?.secondLabelTitle
        confirmButton.setTitle(viewModel?.buttonTitle, for: .normal)
        privacyLabel.text = viewModel?.privacyLabelTitle
        privacyLabel.font = viewModel?.privacyLabelFont
        privacyLabel.textColor = viewModel?.lightGrayColor
        welcomeLabel.font = viewModel?.boldFont
        secondLabel.textColor = viewModel?.lightGrayColor
        pushNumberLabel.textColor = viewModel?.grayColor
        [pushNumberLabel, secondLabel].forEach { $0.font = viewModel?.lightFont }
        [welcomeLabel, pushNumberLabel, secondLabel].forEach { $0.textAlignment = viewModel?.centerText ?? .center}
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches,
                           with: event)
        self.view.endEditing(true)
    }

    // MARK: - Navigation
    private func registrationButtonTapped() {
        guard let phoneNumber = phoneNumberField.text else { return }
        if !phoneNumber.isEmpty, phoneNumber.count == 16 {
            viewModel?.phoneNumber = phoneNumber
            viewModel?.changeState(.buttonTapped)
            stateViewModel(state: .success)
        } else {
            viewModel?.changeState(.error)
            stateViewModel(state: .error)
        }
    }

    private func stateViewModel(state: State) {
        switch state {
            case .viewIsReady:
                addSubviews()
                setupConstraints()
                setColor()
            case .buttonTapped:
                ()
            case .success:
                pushConfirmController()
            case .error:
                showErrorAlert()
        }
    }

    private func pushConfirmController() {
        guard let viewModel = viewModel else {return}
        let model = ConfirmControllerViewModel(viewModel: viewModel)
        let confirmViewController = ConfirmViewController(with: model)
        navigationController?.pushViewController(confirmViewController, animated: true)
    }

    private func showErrorAlert() {
        guard let viewModel else {return}
        let alertTitle = viewModel.alertTitle
        let alertMessage = viewModel.alertMessage
        let actionTitle = viewModel.actionTitle
        Alert.showAleart(for: self, with: alertTitle, aleartMessage: alertMessage,
                         action1Title: actionTitle, handler: { [weak self] _ in
            self?.phoneNumberField.text = ""
        }, action2Title: nil)
    }

    @objc private func backItemAction(){
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension EnterPhoneNumberViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                welcomeLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.inset16),
                welcomeLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.inset16),

                pushNumberLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.inset16),
                pushNumberLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.inset16),

                secondLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.inset16),
                secondLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.inset16),

                phoneNumberField.pinLeading(to: secondLabel.leadingAnchor, inset: Constants.inset16),
                phoneNumberField.pinTrailing(to: secondLabel.trailingAnchor, inset: Constants.inset16),

                confirmButton.pinHeight(equalTo: 44),
                confirmButton.pinLeading(to: phoneNumberField.leadingAnchor, inset: Constants.inset16),
                confirmButton.pinTrailing(to: phoneNumberField.trailingAnchor, inset: Constants.inset16),

                privacyLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.inset16),
                privacyLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.inset16),
            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view, inset: Constants.inset16 * 2),

                pushNumberLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: Constants.inset16 * 2),

                secondLabel.pinTop(to: pushNumberLabel.bottomAnchor, inset: Constants.inset8),

                phoneNumberField.pinHeight(equalTo: 44),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: Constants.inset16),
                phoneNumberField.pinCenterX(to: view),

                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 72),
                confirmButton.pinCenterX(to: view),

                privacyLabel.pinTop(to: confirmButton.bottomAnchor,inset: Constants.inset8)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: Constants.inset8 * 10),
                pushNumberLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: Constants.inset8 * 10),
                secondLabel.pinTop(to: pushNumberLabel.bottomAnchor, inset: Constants.inset8),
                phoneNumberField.pinHeight(equalTo: Constants.inset56),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: Constants.iconHeight24),
                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100),
                privacyLabel.pinTop(to: confirmButton.bottomAnchor,inset: Constants.inset8)
            ]
        )
        activateOrientationConstraints()
        NSLayoutConstraint.activate(commonConstraints)
    }

    private func activateOrientationConstraints() {
        if Orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
}

// MARK: - View Will Transition

extension EnterPhoneNumberViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.activateOrientationConstraints()
        }
    }
}

extension EnterPhoneNumberViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        confirmButton.tintColor = .contentColor
    }
}

extension EnterPhoneNumberViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text?.replacingOccurrences(of: "+7", with: "") else {
            return false
        }
        let newText = text.applyPatternOnNumbers(pattern: "### ### ## ##", replacementCharacter: "#")
        textField.text = "+7 \(newText)"
        let newLength = text.count - 3
        return newLength <= 10 || string.isEmpty
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}


