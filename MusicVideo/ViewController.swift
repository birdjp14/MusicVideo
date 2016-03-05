//
//  ViewController.swift
//  MusicVideo
//
//  Created by Jonathan Ky on 3/4/16.
//  Copyright © 2016 Jonathan Ky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    
    }

    func didLoadData(videos:[Videos]) {
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
        //Use this new way
        
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
        
//        for i in 0..<videos.count {
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
        // This following is old way don't use it
        
//        for var i = 0; i < videos.count; i++ {
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
    }
    
}
