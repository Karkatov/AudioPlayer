//
//  Music.swift
//  AudioPlayer
//
//  Created by Duxxless on 25.12.2021.
//

import Foundation

struct Music {
    let numberAlbum: String
    let track: String
    
    static func allMusic() -> [Music] {
        let allTracks = [Music(numberAlbum: "0", track: "Juice WRLD - From My Window"), Music(numberAlbum: "1", track: "Eгор Крид - Сhoppa"), Music(numberAlbum: "2", track: "Welcome to Brixton")]
        return allTracks
    }
}
