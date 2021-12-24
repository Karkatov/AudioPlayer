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
    
    var playMusicMode = "Off"
    
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
    
        backSongButton.addTarget(self, action: #selector(backSong), for: .touchUpInside)
        
        
        //label
        songLabel.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 400,
                                 height: 30)
        songLabel.center = view.center
        view.addSubview(songLabel)
        songLabel.font = UIFont.systemFont(ofSize: 24)
        songLabel.textAlignment = .center
        songLabel.textColor = .white
        
        songLabel.text = traks[0]
        
        // slider - time tracker
        slider.frame = CGRect(x: 40,
                              y: 420,
                              width: imageView.frame.size.width + 100,
                              height: 10)
        
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.minimumTrackTintColor = .systemBlue
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .systemBlue
        view.addSubview(slider)
        slider.addTarget(self, action: #selector(rewindSlider), for: .valueChanged)
        
        // slider - volume
        volumeSlider.frame = CGRect(x: 85,
                                    y: 800,
                                    width: imageView.frame.size.width,
                                    height: 10)
        
        volumeSlider.maximumValue = 100.0
        volumeSlider.minimumValue = 0.0
        volumeSlider.minimumTrackTintColor = .systemBlue
        volumeSlider.maximumTrackTintColor = .lightGray
        volumeSlider.thumbTintColor = .systemBlue
        view.addSubview(volumeSlider)
        
        volumeSlider.addTarget(self, action: #selector(editVolume), for: .valueChanged)
    }
    
    
    // MARK: - Methods
    
    @objc func playMusic() {
        imageView.image = UIImage(named: String(indexOfSong))
        self.player.play()
        playMusicMode = "On"
        num += 1
        if num % 2 == 0 {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            playMusicMode = "On"
        } else {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.player.stop()
            playMusicMode = "Off"
        }
    }
    
    @objc func nextSong() {
        indexOfSong += 1
        if songLabel.text == traks.last { return }
            
        songLabel.text = traks[indexOfSong]
        setPlayer()
        imageView.image = UIImage(named: String(indexOfSong))
        guard playMusicMode == "On" else { return }
        
        self.player.play()
        
        
    }
    @objc func backSong() {
        indexOfSong -= 1
        if indexOfSong == -1 {
            indexOfSong = 0
        }
        print(indexOfSong)
        if indexOfSong >= traks.count {
            indexOfSong = traks.count - 2
        }
        songLabel.text = traks[indexOfSong]
        setPlayer()
        imageView.image = UIImage(named: String(indexOfSong))
        guard playMusicMode == "On" else { return }
        
        self.player.play()
        playMusicMode = "On"
    }
    
    @objc func rewindSlider() {
        
        self.player.currentTime = TimeInterval(slider.value)
    }
    
    @objc func editVolume() {
        
        self.player.volume = self.volumeSlider.value
    }
        
    
    func setPlayer() {
    do {
            if let audioPath = Bundle.main.path(forResource: traks[indexOfSong], ofType: "mp3") {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
                self.volumeSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("ERRoR")
        }
        
    }
    
}

