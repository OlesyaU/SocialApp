////
////  CommentsCell.swift
////  SocialApp
////
////  Created by Олеся on 05.07.2023.
////
//
//import UIKit
//
//class CommentsCell: UITableViewCell {
//
//    private var viewModel: PublicationViewModel?
//
//    private let tableView = UITableView()
//    private var cellConstraints: [NSLayoutConstraint] = []
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        layout()
//        setTableView()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func layout() {
//        tableView.forAutolayout()
//        contentView.addSubview(tableView)
//        cellConstraints.append(contentsOf: [
//            tableView.pinTop(to: contentView.topAnchor),
//            tableView.pinLeading(to: contentView.leadingAnchor),
//            tableView.pinBottom(to: contentView.bottomAnchor),
//            tableView.pinTrailing(to: contentView.trailingAnchor)
//        ])
//        NSLayoutConstraint.activate(cellConstraints)
//
//    }
//
//    func configure(comments: [Comment]){
//        viewModel?.post.comments = comments
//        print("comments from CommentsCell \(comments.count)")
// }
//
//    private func setTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(OneCommentCell.self, forCellReuseIdentifier: OneCommentCell.identifier)
//        
//        tableView.reloadData()
//    }
//}
//extension CommentsCell: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel?.post.comments.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: OneCommentCell.identifier, for: indexPath) as? OneCommentCell else {return UITableViewCell()}
//
//
//        guard let comment = viewModel?.post.comments[indexPath.row] else {return UITableViewCell()}
//        cell.configure(viewModel: viewModel)
//
//        return cell
//    }
//
//}
