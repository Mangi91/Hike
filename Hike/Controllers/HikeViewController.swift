//
//  HikeViewController.swift
//  Hike
//
//  Created by Manuel Cubillo on 2/9/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

class HikeViewController: UIViewController {
    @IBOutlet weak var carouselThemeCollectionView: ThemeCollectionView!
    @IBOutlet weak var themeContainer: UIView!
    @IBOutlet weak var chat: ChatTableView!
 
    public var chats: [Chat] = [
        Chat(userAvatar:"johng", userName: "John Gutierrez", message: "You down for some video games tonight?", time: "Now", timeIcon: "clock"),
        Chat(userAvatar:"olia", userName: "Olia Sullivan", message: "Are you done with the notes?", time: "Now", timeIcon: "clock"),
        Chat(userAvatar:"elisa", userName: "Elisa Johnson", message: "I had such a great time tonight! 😘", time: "Now", timeIcon: "checkmark"),
        Chat(userAvatar:"charles", userName: "Charles Thompson", message: "Lets meet at the movie theater!", time: "Now", timeIcon: "checkmark"),
        Chat(userAvatar:"john", userName: "John", message: "Checkout my new app design!", time: "Now", timeIcon: "checkmark"),
        Chat(userAvatar:"kevin", userName: "Kevin Smith", message: "We still on for paintball Friday? 😎", time: "9 hrs", timeIcon: "checkmark"),
        Chat(userAvatar:"natalia", userName: "Natalia Garcia", message: "You still need help with your paper?", time: "21 hrs", timeIcon: "checkmark"),
        Chat(userAvatar:"walter", userName: "Walter", message: "Have you watched Altered Carbon on Netflix?", time: "Mon", timeIcon: "checkmark"),
        Chat(userAvatar:"marco", userName: "Marco Olivares", message: "Dude, how'd the job interview go?", time: "12 Sep", timeIcon: nil),
        Chat(userAvatar:"kristina", userName: "Kristina", message: "I can't believe you dont like root beer!!", time: "23 Aug", timeIcon: nil),
        Chat(userAvatar:"brad", userName: "Brad Hill", message: "Dude, we need to go to Hawaii! I hear the waves are gnarly right now!", time: "8 Jun", timeIcon: nil),
        Chat(userAvatar:"kianna", userName: "Kianna Perez", message: "Mom says to call her!", time: "20 May", timeIcon: nil),
        Chat(userAvatar:"michelle", userName: "Michelle Edwards", message: "I'm joining the navy!!!", time: "9 Apr", timeIcon: nil),
        Chat(userAvatar:"natasha", userName: "Natasha Lyonne", message: "I got the part in the play! I'm so excited!", time: "15 Feb", timeIcon: nil),
    ]
    
    //empty elements so you can scroll to end of carousel options
    public var themeImageNames:[String] = ["","","3dglasses","bat","bowtie","lips","feather","heartglasses","crown","mask","pica","sombrero","",""]
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        carouselThemeCollectionView.scrollToItem(at: IndexPath(row:4, section: 0), at: .centeredHorizontally, animated: false)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HikeViewController.themeBackgroundTapped))
        themeContainer.addGestureRecognizer(tapGesture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThemePageVC" {
            let vc = segue.destination as! ThemePageViewController
            vc.themePageVCDelegate = self
        }
    }
    
    @objc func themeBackgroundTapped() {
        if chat.isMinimized {
            chat.maximize()
        } else {
            chat.minimize()
        }
    }
}
