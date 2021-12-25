//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Duxxless on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var namesOfSong: [UIButton]!
    
   
    @IBOutlet var timeLabel: [UILabel]!
    
    @IBOutlet var images: [UIImageView]!
    
    let borderOne = CALayer()
    let borderTwo = CALayer()
    let borderThree = CALayer()
    
    private let music = Music.allMusic()
    var indexSong = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Playlist"
        
        setProperty()
        
    }
}


extension ViewController {
    
    func setProperty() {
        
        for number in 0 ... 2 {
            namesOfSong[number].setTitle(music[number].track, for: .normal)
            images[number].image = UIImage(named: "\(number)")
            namesOfSong[number].contentHorizontalAlignment = .left
            timeLabel[number].alpha = 0.3
            images[number].layer.cornerRadius = 10
        }
        
        // border lines
        borderOne.frame = CGRect(x: -86, y: 64, width: 390, height: 1)
        borderOne.backgroundColor = UIColor.lightGray.cgColor
        namesOfSong[0].layer.addSublayer(borderOne)
        
        borderTwo.frame = CGRect(x: -86, y: 160, width: 390, height: 1)
        borderTwo.backgroundColor = UIColor.lightGray.cgColor
        namesOfSong[0].layer.addSublayer(borderTwo)
        
        borderThree.frame = CGRect(x: -86, y: 160 + 96, width: 390, height: 1)
        borderThree.backgroundColor = UIColor.lightGray.cgColor
        namesOfSong[0].layer.addSublayer(borderThree)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "0" {
            let secondVC = segue.destination as? SecondViewController
            secondVC?.indexOfSong = 0
            
        }
       
        if segue.identifier == "1" {
            let secondVC = segue.destination as? SecondViewController
            secondVC?.indexOfSong = 1
        }
        
        if segue.identifier == "2" {
            let secondVC = segue.destination as? SecondViewController
            secondVC?.indexOfSong = 2
            indexSong = 2
            secondVC?.songLabel.text = music[indexSong].track
            
        }
        
    }
    
    @IBAction func unwindSegue (_ sender: UIStoryboardSegue) {
        
    }
}

