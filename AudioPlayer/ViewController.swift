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
    
    var volumeSlider = UISlider()
    
    let traks = ["Juice WRLD - From My Window",
                 "Eгор Крид - Сhoppa",
                 "Welcome to Brixton"]
    
    var indexOfSong = 0
    
    var num = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setProperties()
        
        setPlayer()
    }
    
    func setProperties() {
        
        // Image
        self.imageView.frame = CGRect(x: 90,
                                      y: 100,
                                      width: 250,
                                      height: 250)
        imageView.image = UIImage(systemName: "music.note")
        imageView.backgroundColor = UIColor(red: 0,
                                            green: 0,
                                            blue: 0,
                                            alpha: 0.3)
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = CGColor(red: 0,
                                              green: 0,
                                              blue: 0,
                                              alpha: 0.1)
        
        self.view.addSubview(imageView)
        
        
        // Buttons
        
        playButton.layer.cornerRadius = 7
        playButton.backgroundColor = .lightGray
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        playButton.imageView?.contentMode = .scaleAspectFill
        playButton.frame = CGRect(x: 180,
                                  y: 700,
                                  width: 70,
                                  height: 50)
        
        self.view.addSubview(playButton)
        
        self.playButton.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        
        
        
        
//        nextSongButton =
        nextSongButton.layer.cornerRadius = 7
        nextSongButton.backgroundColor = .lightGray
        
        nextSongButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        nextSongButton.imageView?.contentMode = .scaleAspectFill
        nextSongButton.frame = CGRect(x: 260,
                                      y: 700,
                                      width: 70,
                                      height: 50)
        
        self.view.addSubview(nextSongButton)
        
        self.nextSongButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        
//        backSongButton =
        backSongButton.layer.cornerRadius = 7
        backSongButton.backgroundColor = .lightGray
        
        backSongButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        backSongButton.imageView?.contentMode = .scaleAspectFill
        backSongButton.frame = CGRect(x: 100,
                                      y: 700,
                                      width: 70,
                                      height: 50)
        
        self.view.addSubview(backSongButton)
    
        
        // slider
        slider.frame = CGRect(x: 20,
                              y: 420,
                              width: imageView.frame.size.width + 140,
                              height: 10)
        view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .systemBlue
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .systemBlue
        
        //label
        songLabel.frame = CGRect(x: 20,
                                 y: 600,
                                 width: 210,
                                 height: 30)
        view.addSubview(songLabel)
        songLabel.font = UIFont.systemFont(ofSize: 20)
        songLabel.center = view.center
        songLabel.text = traks[0]
    
        // slider
        volumeSlider.frame = CGRect(x: 20,
                                    y: 800,
                                    width: imageView.frame.size.width + 140,
                                    height: 10)
        view.addSubview(volumeSlider)
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = 100
        volumeSlider.value = 50
        volumeSlider.minimumTrackTintColor = .systemBlue
        volumeSlider.maximumTrackTintColor = .lightGray
        volumeSlider.thumbTintColor = .systemBlue
        
        
    }
    
    
    // MARK: - Methods
    
    @objc func playMusic() {
        self.player.play()
        num += 1
        if num % 2 == 0 {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        } else {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.player.stop()
        }
    }
    
    @objc func nextSong() {
        indexOfSong += 1
        if songLabel.text == traks.last { return }
            
        songLabel.text = traks[indexOfSong]
        setPlayer()
        self.player.play()
        
    }
    func setPlayer() {
    do {
            if indexOfSong != nil, let audioPath = Bundle.main.path(forResource: traks[indexOfSong], ofType: "mp3") {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("ERRoR")
        }
        
    }
    
}

