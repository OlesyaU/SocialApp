//
//  ProfileViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class ProfileViewController: UITableViewController {

    private var viewModel = ProfileViewModel()
    private var friend: Profile?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        tableView.register(PhotosCell.self, forCellReuseIdentifier: PhotosCell.identifier)
        tableView.register(FindMyPostsCell.self, forCellReuseIdentifier: FindMyPostsCell.identifier)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        print(viewModel.personalData.isMyProfile )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        if viewModel.personalData.isMyProfile {
            return 6
//        } else {
//            return 5
//        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.personalData.isMyProfile {

            switch section {
                case 0:
                    return 1
                case 1:
                    return 1
                case 2:
                    return 1
                case 3:
                    return 1
                case 4:
                    return 1
                default:
                    return viewModel.testProfile.posts.count
            }
        } else {
            switch section {
                case 0:
                    return 1
                case 1:
                    return 1
                case 2:
                    return 1
                case 3:
                    return 0
                case 4:
                    return 1
                default:
                    return friend?.posts.count ?? 10
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let personalDataCell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
                if viewModel.personalData.isMyProfile {

                    personalDataCell.configure(with: viewModel.personalData)
                } else {
                    personalDataCell.configure(with: PersonalDataViewModel(profile: friend!))
                }
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
                if viewModel.personalData.isMyProfile {
                    photosCell.configure(viewModel: viewModel.photosCellViewModel)
                } else {
                    photosCell.configure(viewModel: PhotosCellViewModel(profile: friend!))
                }
                return photosCell

            case 4:
                guard let findCell = tableView.dequeueReusableCell(withIdentifier: FindMyPostsCell.identifier, for: indexPath) as? FindMyPostsCell else {return UITableViewCell()}
                findCell.configure(viewModel: viewModel.findViewModel)
                return findCell
            default:
                guard let postDataCell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
                var post = viewModel.testProfile.posts[indexPath.row]
                postDataCell.configureCell(post: post)
                return postDataCell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func configure(profile: Profile) {
        navigationItem.title = profile.nickname.lowercased()

        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(dotsAction), imageName: viewModel.dotsIcon, tintColor: AppColors.orange)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: viewModel.leftArrowIconString), style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem?.tintColor = AppColors.orange
//        viewModel.personalData.isMyProfile.toggle()
        //        viewModel.testProfile = profile
        self.friend = profile

    }

    @objc private func dotsAction(){
        print(#file, #line)
        //        TODO: - set action (push view with profile information more something like this)

    }
    @objc private func backAction(){
        navigationController?.popViewController(animated: true)
    }
}
