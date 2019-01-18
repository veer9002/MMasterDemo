//
//  VideoViewController.swift
//  MMasterDemo
//
//  Created by Syon on 18/01/19.
//  Copyright © 2019 Manish Sharma. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController {

    @IBOutlet weak var ytView: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoUrl = URL(string: "https://www.youtube.com/watch?v=Kp4R97XGGpY")
        ytView.loadVideoURL(videoUrl!)
    }
    
}
