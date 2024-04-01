//
//  FollewersListVC.swift
//  GHFollowers
//
//  Created by mert Akturk on 27.03.2024.
//

import UIKit

class FollewersListVC: UIViewController {
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) {
            (followers, errorMesage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: errorMesage!.rawValue, buttonTitle: "Ok")
                return
            }
            print("Followers = \(followers)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
