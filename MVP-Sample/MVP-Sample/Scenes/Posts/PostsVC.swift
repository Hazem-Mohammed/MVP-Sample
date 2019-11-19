//
//  PostsVC.swift
//  MVP-Sample
//
//  Created by Hazem Mohammed on 11/19/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var presenter: PostsVCPresenter!
    private let progressHUD = ProgressHUD(text: "Loading...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        title = "Posts"
        presenter = PostsVCPresenter(view: self)
        presenter.viewDidLoad()
    }
}

extension PostsVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    // Apply only if you have a detail's view
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        //presenter.didSelectRow(index: indexPath.row)
    //    }
}

extension PostsVC: PostsView {
    
    func showIndicator() {
        //SKActivityIndicator.show()
        view.addSubview(progressHUD)
    }
    
    func hideIndicator() {
        //SKActivityIndicator.dismiss()
        DispatchQueue.main.async {
            self.progressHUD.removeFromSuperview()
        }
    }
    
    func fetchingDataSuccess() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }
    
    func showError(error: String) {
        print(error)
    }
    
    // Apply only if you have a detail's view
    
    //    func navigateToPostDetailsScreen(post: Post) {
    //        navigationController?.pushViewController(UIViewController(), animated: true)
    //    }
}
