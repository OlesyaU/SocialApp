//
//  PublicationViewController.swift
//  SocialApp
//
//  Created by Олеся on 04.07.2023.
//

import UIKit
import FloatingPanel
protocol PublicationControllerProtocol {
    func openPostMenuFromProfile(post: Post, indexPath: IndexPath)
    func showMenuViewController()
}


class PublicationViewController: UIViewController, FloatingPanelControllerDelegate {
   
    private var viewModel: PublicationViewModel?
    private var floatingPanel: FloatingPanelController?
    private let tableDotsMenu = ProfileDotsController()
    private let tableView = UITableView()
    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configureTableView()
    }

    func configure(post: Post) {
        viewModel = PublicationViewModel(post: post)

        navigationItem.title = viewModel?.titleController

        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(
            self,
            action: #selector(dotsAction),
            imageName: viewModel?.dotsIconName ?? "",
            tintColor: viewModel?.colorNickname ?? .white
        )

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: viewModel?.arrowIcon ?? "")?.withTintColor(viewModel?.colorNickname ?? .white),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )

        navigationItem.leftBarButtonItem?.tintColor = viewModel?.colorNickname

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
        tableView.register(CommentCell.self, forCellReuseIdentifier: CommentCell.identifier)
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

extension PublicationViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return viewModel?.post.comments.count ?? 0
            default:
                    return .zero
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = viewModel?.post else { return UITableViewCell() }
        switch indexPath.section {
            case 0:
                let postCell = FeedCell()
                postCell.publicationDelegate = self
                postCell.configurePublicationCell(post: post)
                return postCell
            case 1:
                let cell = FindMyPostsCell()
                cell.configureForComments(for: post)
                return cell
            case 2:
                guard let oneCommentCell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell,
                      post.comments.count > indexPath.row
                else {return UITableViewCell()}
                let vm = CommentViewModel(comment: post.comments[indexPath.row])
                oneCommentCell.configure(viewModel: vm)
                return oneCommentCell
            default:
                return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension PublicationViewController: PublicationControllerProtocol {

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

}
