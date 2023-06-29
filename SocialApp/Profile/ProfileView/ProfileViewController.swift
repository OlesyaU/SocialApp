//
//  ProfileViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class ProfileViewController: UITableViewController {

    lazy var actionsViewModels: [ProfileActionViewModel] = [
        .init(isSelected: true, type: .publications(count: 1400), onModelSelected:  { [weak self] _ in
            print("tapped publications action")
        }),
        .init(isSelected: false, type: .subscribers(count: 5), onModelSelected: { [weak self] _ in
            print("tapped subscribers action")
        }),
        .init(isSelected: false, type: .subscriptions(count: 3), onModelSelected:  { [weak self] _ in
            print("tapped subscriptions action")
        })
    ]

    let buttonViewModels: [ProfileIconButtonViewModel] = [
        .init(type: .write, action: {
            print("write")
        }),
        .init(type: .history, action: {
            print("history")
        }),
        .init(type: .photo, action: {
            print("photo")
        })
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        tableView.register(ProfileActionsCell.self, forCellReuseIdentifier: ProfileActionsCell.identifier)
        tableView.register(ProfileIconButtonsCell.self, forCellReuseIdentifier: ProfileIconButtonsCell.identifier)
        tableView.register(PhotosCell.self, forCellReuseIdentifier: PhotosCell.identifier)
        tableView.register(ProfilePostsCell.self, forCellReuseIdentifier: ProfilePostsCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 1
            case 3:
                return 1
            default:
                return 10
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let personalDataCell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else { return UITableViewCell() }

                // TODO: - Взять из вью - модели
                let testProfile = DataBase.shared.testProfile
                let viewModel = PersonalDataViewModel(profile: testProfile)
                personalDataCell.configure(with: viewModel)
                return personalDataCell
            case 1:
                guard let profileActionsCell = tableView.dequeueReusableCell(withIdentifier: ProfileActionsCell.identifier, for: indexPath) as? ProfileActionsCell else { return UITableViewCell()}
                profileActionsCell.configure(viewModels: actionsViewModels)
                return profileActionsCell
            case 2:
                guard let buttonsIconCell = tableView.dequeueReusableCell(withIdentifier: ProfileIconButtonsCell.identifier, for: indexPath) as? ProfileIconButtonsCell else { return UITableViewCell() }
                buttonsIconCell.configure(viewModels: buttonViewModels)
                return buttonsIconCell
            case 3:
                guard let photosCell = tableView.dequeueReusableCell(withIdentifier: PhotosCell.identifier, for: indexPath) as? PhotosCell else {return UITableViewCell()}
                let testProfile = DataBase.shared.testProfile
                var photosCellViewModel = PhotosCellViewModel(profile: testProfile)
                photosCell.configure(viewModel: photosCellViewModel)
                
                return photosCell
            default:
                guard let postDataCell = tableView.dequeueReusableCell(withIdentifier: ProfilePostsCell.identifier, for: indexPath) as? ProfilePostsCell else { return UITableViewCell() }
                return postDataCell
        }


 }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//            case 3:
//                return 250
//            default:
//                return UITableView.automaticDimension
//        }
        UITableView.automaticDimension
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
