//
//  Song.swift
//  MusicPlayer
//
//  Created by 莊宇軒 on 2020/1/5.
//  Copyright © 2020 kffatkalo. All rights reserved.
//

import Foundation

struct Song {
    let name: String
    let singer: String
    let lyric: [Lyric]?
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
        lyric = nil
    }
    
    init(name: String, singer: String, lyric: [Lyric]) {
        self.name = name
        self.singer = singer
        self.lyric = lyric
    }
    
    struct Lyric {
        let time: Int
        let words: String
        init(time: String, words: String) {
            var times = time.split(separator: ":")
            times.insert(contentsOf: times.remove(at: 1).split(separator: "."), at: 1)
            let min = Int(times[0])
            let sec = Int(times[1])
            let miliSec = Int(times[2])
            
            self.time = min! * 60000 + sec! * 1000 + miliSec!
            self.words = words
        }
    }
}
