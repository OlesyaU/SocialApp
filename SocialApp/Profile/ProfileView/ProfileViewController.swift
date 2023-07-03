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
//    func addDotsMenuContainerView()
    }

class ProfileViewController: UITableViewController, FloatingPanelControllerDelegate {
    private var viewModel = ProfileViewModel()
    private var floatingPanel: FloatingPanelController?
   private let tableDotsMenu = ProfileDotsController()
    private var dotsOrigin: CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        tableView.register(PhotosCell.self, forCellReuseIdentifier: PhotosCell.identifier)
        tableView.register(FindMyPostsCell.self, forCellReuseIdentifier: FindMyPostsCell.identifier)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let personalDataCell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
//        dotsOrigin = cell.contentView.frame

//DOESN"T WORK
    }

    func configure(profile: Profile) {
        navigationItem.title = profile.nickname.lowercased()

        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(dotsAction), imageName: viewModel.dotsIcon, tintColor: AppColors.orange)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: viewModel.leftArrowIconString), style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem?.tintColor = AppColors.orange
        viewModel.personalData = PersonalDataViewModel(profile: profile)
    }

    @objc private func dotsAction(){
        print(#file, #line)
        //        TODO: - set action (push view with profile information more something like this) go to moreInfoVC
 }

    @objc private func backAction(){
        navigationController?.popViewController(animated: true)
    }
}


extension ProfileViewController: ProfileDotsProtocol {


    func openPostMenuFromProfile(post: Post, indexPath: IndexPath) {
//        tableView.rowHeight

        addContainerForPostDotsMenu()
        tableDotsMenu.view.isUserInteractionEnabled = false
        guard let cell = tableView.cellForRow(at: indexPath) as? FeedCell else { return }
        cell.dotsImage.frame(forAlignmentRect: view.frame)
        let frame = calculateFrame(cellFrame: cell.frame, dotsFrame: cell.dotsImage.frame)
        tableDotsMenu.layout(frame: frame)
//        tableDotsMenu.view.frame = view.frame

//        tableDotsMenu.view.frame = tableView.rect(forSection: 5)
//        tableDotsMenu.view.frame = tableDotsMenu.tableView.frame
//        tableDotsMenu.view.frame.origin.x = tableView.rect(forSection: 5).origin.x + 40
//        tableDotsMenu.view.frame.size.height = tableView.rect(forSection: 5).height - 40
//        tableDotsMenu.view.frame = CGRect(x: view.frame.origin.x - (view.frame.origin.x / 3), y: view.frame.origin.y + (view.frame.origin.y / 3), width: view.frame.width - (view.frame.width / 3 ) , height: view.frame.height - (view.frame.height / 3))
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
    private func addContainerForPostDotsMenu() {
        let viewForDotsMenu = DotsContainerView()
        viewForDotsMenu.forAutolayout()

//        viewForDotsMenu.backgroundColor = .red
//        viewForDotsMenu.alpha = 0.5
//        tableView.addSubview(viewForDotsMenu)
        
                NSLayoutConstraint.activate([
                    viewForDotsMenu.pinTop(to: self.view.topAnchor),
                    viewForDotsMenu.pinBottom(to: self.view.bottomAnchor),
                    viewForDotsMenu.pinLeading(to: self.view.leadingAnchor),
                    viewForDotsMenu.pinTrailing(to: self.view.trailingAnchor)
                ])
//        tableView.bringSubviewToFront(viewForDotsMenu)
        tableView.isScrollEnabled = false
        viewForDotsMenu.backgroundColor = .red
        let tap = UITapGestureRecognizer(target: self, action: #selector(clearMenuTap))
        viewForDotsMenu.addGestureRecognizer(tap)
//            }
//        viewForDotsMenu.pinEdges(to: view)
    }
    @objc private func clearMenuTap() {

        tableView.isScrollEnabled = true
        tableDotsMenu.prepareForRemove()
       
//removeFromParent()
    }
}
