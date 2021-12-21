//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Duxxless on 21.12.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    var imageView = UIImageView()
    
    var playButton = UIButton()
    var pauseButton = UIButton()
    var nextSongButton = UIButton()
    var backSongButton = UIButton()
    
    var slider = UISlider()
    
    var songLabel = UILabel()
    
    let traks = ["Juice WRLD - From My Window",
                 "Eгор Крид - Сhoppa",
                 "Welcome to Brixton"]
    
    var indexOfSong: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        
        do {
            if indexOfSong != nil, let audioPath = Bundle.main.path(forResource: traks[indexOfSong], ofType: "mp3") {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("ERRoR")
        }
        
        // self.player.play()
    }
    
    func setProperties() {
        
        // Image
        self.imageView.frame = CGRect(x: 90, y: 100, width: 250, height: 250
        )
        imageView.image = UIImage(systemName: "music.note")
        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        self.view.addSubview(imageView)
        
        
        // Buttons
        
        playButton.layer.cornerRadius = 7
        playButton.backgroundColor = .lightGray
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        playButton.imageView?.contentMode = .scaleAspectFill
        playButton.frame = CGRect(x: 180, y: 700, width: 70, height: 50)
        
        self.view.addSubview(playButton)
        
        
//        nextSongButton =
        nextSongButton.layer.cornerRadius = 7
        nextSongButton.backgroundColor = .lightGray
        
        nextSongButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        nextSongButton.imageView?.contentMode = .scaleAspectFill
        nextSongButton.frame = CGRect(x: 260, y: 700, width: 70, height: 50)
        
        self.view.addSubview(nextSongButton)
        
//        backSongButton =
        backSongButton.layer.cornerRadius = 7
        backSongButton.backgroundColor = .lightGray
        
        backSongButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        backSongButton.imageView?.contentMode = .scaleAspectFill
        backSongButton.frame = CGRect(x: 100, y: 700, width: 70, height: 50)
        
        self.view.addSubview(backSongButton)
    
        
        // slider
        slider.frame = CGRect(x: 20, y: 420, width: imageView.frame.size.width + 140, height: 10)
        view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .systemBlue
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .systemBlue
        
        //label
        songLabel.frame
    }
    
}

