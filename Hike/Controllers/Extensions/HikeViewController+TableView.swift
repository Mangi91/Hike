//
//  HikeViewController+TableView.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/16/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension HikeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ChatCell", for: indexPath) as! ChatTableViewCell
        cell.setup(withChat: chats[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
