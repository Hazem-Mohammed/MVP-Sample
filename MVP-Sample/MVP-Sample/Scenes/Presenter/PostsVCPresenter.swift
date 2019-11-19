//
//  PostsVCPresenter.swift
//  MVP-Sample
//
//  Created by Hazem Mohammed on 11/19/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation

protocol PostsView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    
    // Apply only if you have a detail's view
    
    //func navigateToPostDetailsScreen(post: Post)
}

protocol PostCellView {
    func displayUserId(id: String)
    func displayPostId(postId: String)
    func displayPostTitle(title: String)
}

class PostsVCPresenter {
    
    private weak var view: PostsView?
    private let interactor = PostsInteractor()
    private var posts = [Post]()
    
    init(view: PostsView) {
        self.view = view
    }
    
    func loadData() {
        getPosts()
    }
    
    func getPosts() {
        view?.showIndicator()
        interactor.getPosts { [weak self] posts, error in
            guard let self = self else { return } //And note this is only available from swift 4.2
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let posts = posts else { return }
                self.posts = posts
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func getUsersCount() -> Int {
        return posts.count
    }
    
    func configure(cell: PostCellView, for index: Int) {
        let post = posts[index]
        cell.displayUserId(id: "userId: \(post.userId)")
        cell.displayPostId(postId: "id: \(post.id)")
        cell.displayPostTitle(title: "title: \(post.title)")
    }
    
    // Apply only if you have a detail's view
    
    //    func didSelectRow(index: Int) {
    //        let post = posts[index]
    //        view?.navigateToUserDetailsScreen(user: post)
    //    }
    
}
