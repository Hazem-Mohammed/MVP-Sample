//
//  PostCell.swift
//  MVP-Sample
//
//  Created by Hazem Mohammed on 11/19/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell, PostCellView {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func displayUserId(id: String) {
        userIdLabel.text = id
    }
    
    func displayPostId(postId: String) {
        postIdLabel.text = postId
    }
    
    func displayPostTitle(title: String) {
        postTitleLabel.text = title
    }
}
