//
//  ProfileViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit
import FloatingPanel

protocol ProfileDotsProtocol {
    func openPostMenuFromProfile(post: Post, indexPath: IndexPath)
    func showMenuViewController()
}

class ProfileViewController: UIViewController, FloatingPanelControllerDelegate {
    private var viewModel = ProfileViewModel()
    private var floatingPanel: FloatingPanelController?
    private let tableDotsMenu = ProfileDotsController()
    private let tableView = UITableView()
    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configureTableView()
    }

    func configure(profile: Profile) {
        viewModel.personalData = PersonalDataViewModel(profile: profile)
        navigationItem.title = profile.nickname.lowercased()

        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(
            self,
            action: #selector(dotsAction),
            imageName: viewModel.dotsIcon,
            tintColor: AppColors.orange
        )

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: viewModel.leftArrowIconString),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )

        navigationItem.leftBarButtonItem?.tintColor = AppColors.orange
    }

    private func layout() {
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.backgroundColor = .clear

        tableView.forAutolayout()
        containerView.forAutolayout()

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.pinTop(to: view),
            tableView.pinBottom(to: view),
            tableView.pinLeading(to: view),
            tableView.pinTrailing(to: view),

            containerView.pinTop(to: view),
            containerView.pinBottom(to: view),
            containerView.pinLeading(to: view),
            containerView.pinTrailing(to: view)
        ])
        containerView.isHidden = true
    }

    private func configureTableView() {
        tableView.allowsSelection = false
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        tableView.register(PhotosCell.self, forCellReuseIdentifier: PhotosCell.identifier)
        tableView.register(FindMyPostsCell.self, forCellReuseIdentifier: FindMyPostsCell.identifier)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
    }

    @objc private func dotsAction(){
        print(#file, #line)
        //        TODO: - set action (push view with profile information more something like this) go to moreInfoVC
    }

    @objc private func backAction(){
        navigationController?.popViewController(animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return viewModel.personalData.isMyProfile ? 1 : 0
        case 3:
            return 1
        case 4:
            return 1
        default:
            return viewModel.posts.filter({$0.author.nickname == viewModel.personalData.nickname}).count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let personalDataCell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
                let testProfile = DataBase.shared.testProfile

                viewModel.personalData.onBurgerButtonSelected = { [weak self] in
                self?.showRedactProfileModule()
            }
//
            personalDataCell.configure(with: viewModel.personalData)
            return personalDataCell

        case 1:
            let profileActionsCell = ProfileActionsCell()
            profileActionsCell.configure(viewModels: viewModel.actionsViewModels)
            return profileActionsCell

        case 2:
            if viewModel.personalData.isMyProfile != true {
                fallthrough
            }

            let buttonsIconCell = ProfileIconButtonsCell()
            buttonsIconCell.configure(viewModels: viewModel.buttonViewModels)
            return buttonsIconCell
        case 3:
            guard let photosCell = tableView.dequeueReusableCell(withIdentifier: PhotosCell.identifier, for: indexPath) as? PhotosCell else {return UITableViewCell()}
            photosCell.configure(viewModel: viewModel.photosCellViewModel)
            return photosCell
        case 4:
            guard let findCell = tableView.dequeueReusableCell(withIdentifier: FindMyPostsCell.identifier, for: indexPath) as? FindMyPostsCell else {return UITableViewCell()}
            if viewModel.personalData.isMyProfile {
                findCell.configure(viewModel: viewModel.findViewModel)
            } else {
                findCell.configureFriend(for: viewModel.findViewModel)
            }
            return findCell
        default:
            guard let postDataCell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
            var post: Post
            postDataCell.postMenuDelegate = self
            if viewModel.personalData.isMyProfile {

                post = viewModel.testProfile.posts[indexPath.row]
            } else {

                //                    post = viewModel.posts[indexPath.row]
                /// -  show posts this friend

                post = viewModel.posts.filter({$0.author.nickname == viewModel.personalData.nickname})[indexPath.row]
            }

            postDataCell.configureCell(post: post, indexPath: indexPath)

            return postDataCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileViewController: ProfileDotsProtocol {
    func openPostMenuFromProfile(post: Post, indexPath: IndexPath) {
        containerView.isHidden = false
        tableDotsMenu.view.isUserInteractionEnabled = false
        guard let cell = tableView.cellForRow(at: indexPath) as? FeedCell else { return }
        cell.dotsImage.frame(forAlignmentRect: view.frame)
        let dotsHeight = cell.dotsImage.frame.height
        let frame = calculateFrame(cellFrame: cell.frame, dotsFrame: cell.dotsImage.frame)
        let point = cell.convert(cell.dotsImage.frame.origin, to: view)
        let newOriginX = point.x - 300
        let newFrame = CGRect(origin: .init(x: newOriginX, y: point.y + dotsHeight / 2), size: .init(width: 300, height: 300))
        tableDotsMenu.layout(frame: newFrame)

        addChildViewController(tableDotsMenu)
        view.contentMode = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(clearMenuTap))
        view.addGestureRecognizer(tap)
    }

    private func calculateFrame(cellFrame: CGRect, dotsFrame: CGRect) -> CGRect {
        let originX = cellFrame.origin.x + dotsFrame.origin.x - 300
        let originY = cellFrame.origin.y + dotsFrame.origin.y + dotsFrame.height / 2
        let width = dotsFrame.width
        let height = dotsFrame.height
        return .init(x: originX, y: originY, width: width, height: height)
    }

    func showMenuViewController() {
        let menuViewController = MenuViewController()

        let floatingPanelController = FloatingPanelController()
        floatingPanelController.delegate = self
        floatingPanelController.surfaceView.layer.cornerRadius = 12
        floatingPanelController.surfaceView.clipsToBounds = true
        floatingPanelController.set(contentViewController: menuViewController)

        floatingPanelController.isRemovalInteractionEnabled = true
        present(floatingPanelController, animated: true)
        floatingPanel = floatingPanelController
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }


    @objc private func clearMenuTap() {
        containerView.isHidden = true
        tableView.isScrollEnabled = true
        tableDotsMenu.prepareForRemove()
    }
    private func showRedactProfileModule() {
        // TODO: - Взять профиль из viewModel
        let profileViewModel = ProfileInformationViewModel(profile: DataBase.shared.testProfile)
        let viewController = ProfileInformationViewController(viewModel: profileViewModel)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
