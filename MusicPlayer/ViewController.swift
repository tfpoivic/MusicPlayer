//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 莊宇軒 on 2020/1/5.
//  Copyright © 2020 kffatkalo. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var remainTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playTypeButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    
    let songs = [Song(name: "修煉愛情", singer:"林俊傑", lyric: [Song.Lyric(time: "00:16.54", words: "憑什麼要失望"), Song.Lyric(time: "00:23.50", words: "藏眼淚到心臟"), Song.Lyric(time: "00:23.50", words: "藏眼淚到心臟"), Song.Lyric(time: "00:28.45", words: "往事不會說謊"), Song.Lyric(time: "00:30.76", words: "別跟它為難"), Song.Lyric(time: "00:35.55", words: "我們兩人之間"), Song.Lyric(time: "00:37.78", words: "不需要這樣"), Song.Lyric(time: "00:42.12", words: "我想"), Song.Lyric(time: "00:45.67", words: "修煉愛情的心酸"), Song.Lyric(time: "00:49.25", words: "學會放好"), Song.Lyric(time: "00:50.35", words: "以前的渴望"), Song.Lyric(time: "00:53.33", words: "我們那些信仰"), Song.Lyric(time: "00:55.59", words: "要忘記多難"), Song.Lyric(time: "00:59.95", words: "遠距離的欣賞"), Song.Lyric(time: "01:01.78", words: "近距離的迷惘"), Song.Lyric(time: "01:03.56", words: "誰說太陽"), Song.Lyric(time: "01:04.59", words: "會找到月亮"), Song.Lyric(time: "01:07.51", words: "別人有的愛"), Song.Lyric(time: "01:09.44", words: "我們不可能模仿"), Song.Lyric(time: "01:14.12", words: "修煉愛情的悲歡"), Song.Lyric(time: "01:17.71", words: "我們這些努力"), Song.Lyric(time: "01:19.64", words: "不簡單"), Song.Lyric(time: "01:21.84", words: "快樂煉成淚水"), Song.Lyric(time: "01:24.01", words: "是一種勇敢"), Song.Lyric(time: "01:28.42", words: "幾年前的幻想"), Song.Lyric(time: "01:30.23", words: "幾年後的原諒"), Song.Lyric(time: "01:32.08", words: "為一張臉"), Song.Lyric(time: "01:33.11", words: "去養一身傷"), Song.Lyric(time: "01:35.99", words: "別講想念我"), Song.Lyric(time: "01:37.95", words: "我會受不了這樣"),Song.Lyric(time: "01:41.41", words: ""), Song.Lyric(time: "01:45.30", words: "記憶它真囂張"), Song.Lyric(time: "01:52.35", words: "路燈把痛點亮"), Song.Lyric(time: "01:57.38", words: "情人一起看過"), Song.Lyric(time: "01:59.66", words: "多少次月亮"), Song.Lyric(time: "02:04.41", words: "他在天空看過"), Song.Lyric(time: "02:06.74", words: "多少次遺忘"), Song.Lyric(time: "02:11.03", words: "多少心慌"), Song.Lyric(time: "02:14.54", words: "修煉愛情的心酸"), Song.Lyric(time: "02:18.10", words: "學會放好"), Song.Lyric(time: "02:19.28", words: "以前的渴望"), Song.Lyric(time: "02:22.13", words: "我們那些信仰"), Song.Lyric(time: "02:24.45", words: "要忘記多難"), Song.Lyric(time: "02:28.82", words: "遠距離的欣賞"), Song.Lyric(time: "02:30.66", words: "近距離的迷惘"), Song.Lyric(time: "02:32.39", words: "誰說太陽"), Song.Lyric(time: "02:33.46", words: "會找到月亮"), Song.Lyric(time: "02:36.34", words: "別人有的愛"), Song.Lyric(time: "02:38.30", words: "我們不可能模仿"), Song.Lyric(time: "02:42.98", words: "修煉愛情的悲歡"), Song.Lyric(time: "02:46.58", words: "我們這些努力"), Song.Lyric(time: "02:48.61", words: "不簡單"), Song.Lyric(time: "02:50.63", words: "快樂煉成淚水"), Song.Lyric(time: "02:52.90", words: "是一種勇敢"), Song.Lyric(time: "02:57.24", words: "幾年前的幻想"), Song.Lyric(time: "02:59.14", words: "幾年後的原諒"), Song.Lyric(time: "03:00.91", words: "為一張臉"), Song.Lyric(time: "03:01.89", words: "去養一身傷"), Song.Lyric(time: "03:04.91", words: "別講想念我"), Song.Lyric(time: "03:06.85", words: "我會受不了這樣"), Song.Lyric(time: "03:10.08", words: ""), Song.Lyric(time: "03:23.21", words: "笑著說"), Song.Lyric(time: "03:27.64", words: "愛讓人堅強"), Song.Lyric(time: "03:30.16", words: "忘不了那個人"), Song.Lyric(time: "03:32.94", words: "就投降"), Song.Lyric(time: "03:38.35", words: "修煉愛情的悲歡"), Song.Lyric(time: "03:41.68", words: "我們這些努力"), Song.Lyric(time: "03:43.64", words: "不簡單"), Song.Lyric(time: "03:45.76", words: "快樂煉成淚水"), Song.Lyric(time: "03:48.01", words: "是一種勇敢"), Song.Lyric(time: "03:52.34", words: "幾年前的幻想"), Song.Lyric(time: "03:54.20", words: "幾年後的原諒"), Song.Lyric(time: "03:55.96", words: "為一張臉"), Song.Lyric(time: "03:57.02", words: "去養一身傷"), Song.Lyric(time: "03:59.92", words: "別講想念我"), Song.Lyric(time: "04:01.87", words: "我會受不了這樣"), Song.Lyric(time: "04:06.55", words: "幾年前的幻想"), Song.Lyric(time: "04:08.40", words: "幾年後的原諒"), Song.Lyric(time: "04:10.20", words: "為一張臉"), Song.Lyric(time: "04:11.26", words: "去養一身傷"), Song.Lyric(time: "04:14.20", words: "別講想念我"), Song.Lyric(time: "04:16.11", words: "我會受不了這樣")]), Song(name: "可惜沒如果", singer: "林俊傑"), Song(name: "那些你很冒險的夢", singer: "林俊傑"), Song(name: "不為誰而作的歌", singer: "林俊傑"), Song(name: "給我一個理由忘記", singer: "A-Lin")]
    let player = AVPlayer()
    var index = 0
    var duration: Float64 = 0
    var nowPlayingInfo = [String : Any]()
    var canSetTime = false
    var timer: Timer?
    var timeObserverToken: Any?
    var isPlaying = false
    var playType = "normal"
    var playList: [Song] = []
    var isShuffed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        let volumeView = MPVolumeView(frame: CGRect(x: 51, y: 660, width: 312, height: 30))
        view.addSubview(volumeView)
        playList = songs
        prepareSong(index: index)
        setupRemoteTransportControls()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { (_) in
            switch self.playType {
            case "normal":
                if self.index == self.playList.count - 1 {
                    self.isPlaying = false
                    self.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                }
            case "repeatOne":
                self.index -= 1
            default:
                break
            }
            self.index += 1
            self.index %= self.playList.count
            self.player.pause()
            self.prepareSong(index: self.index)
            self.play()
        }
    }
    
    @IBAction func PlayerControl(_ sender: UIButton) {
        if !isPlaying {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isPlaying = true
            play()
        } else {
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.pause()
            isPlaying = false
        }
    }
    
    @IBAction func setTime(_ sender: UISlider, forEvent event: UIEvent) {
        let touch = event.allTouches?.first
        switch touch?.phase {
        case .began:
            self.removePeriodicTimeObserver()
        case .moved:
            currentTimeLabel.text = formatTime(time: Float64(musicSlider.value))
            remainTimeLabel.text = "-\(formatTime(time: Float64(musicSlider.maximumValue - musicSlider.value)))"
        case .ended:
            let seconds = Int64(sender.value) + 1
            let targetTime: CMTime = CMTime(seconds: Double(seconds), preferredTimescale: 1)
            player.seek(to: targetTime)
            player.pause()
            play()
        default:
            break
        }
    }
    
    @IBAction func changeSong(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "next":
            if index == playList.count - 1, playType != "repeatAll" {
                isPlaying = false
                playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            }
            index += 1
            index %= playList.count
        case "previous":
            if player.currentTime().seconds < 4 {
                if index > 0 {
                    index -= 1
                } else if index == 0, playType == "repeatAll" {
                    index = playList.count - 1
                }
            }
        default:
            break
        }
        player.pause()
        prepareSong(index: index)
        play()
        
    }
    
    @IBAction func changePlayType(_ sender: UIButton) {
        switch playType {
        case "normal":
            playType = "repeatAll"
            playTypeButton.backgroundColor = UIColor.systemOrange
            playTypeButton.tintColor = UIColor.white
        case "repeatAll":
            playType = "repeatOne"
            playTypeButton.setImage(UIImage(systemName: "repeat.1"), for: .normal)
        case "repeatOne":
            playType = "normal"
            playTypeButton.setImage(UIImage(systemName: "repeat"), for: .normal)
            playTypeButton.backgroundColor = UIColor.clear
            playTypeButton.tintColor = UIColor.systemOrange
        default:
            break
        }
    }
    
    @IBAction func shuffedSwitch(_ sender: UIButton) {
        if isShuffed {
            index = songs.firstIndex(where: { (song) -> Bool in
                (song.name + song.singer) == (self.playList[index].name + self.playList[index].singer)
            })!
            playList = songs
            shuffleButton.backgroundColor = UIColor.clear
            shuffleButton.tintColor = UIColor.systemOrange
        } else {
            playList = songs.shuffled()
            shuffleButton.backgroundColor = UIColor.systemOrange
            shuffleButton.tintColor = UIColor.white
            index = playList.firstIndex(where: { (song) -> Bool in
                (song.name + song.singer) == (self.songs[index].name + self.songs[index].singer)
            })!
        }
        isShuffed = !isShuffed
        print(index)
    }
    
    func play() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if self.isPlaying {
                self.addPeriodicTimeObserver()
                self.player.play()
            }
        }
    }
    
    func prepareSong(index: Int) {
        let songName = playList[index].name + "-" +  playList[index].singer
        titleLabel.text = playList[index].name
        nowPlayingInfo[MPMediaItemPropertyTitle] = playList[index].name
        singerLabel.text = playList[index].singer
        nowPlayingInfo[MPMediaItemPropertyArtist] = playList[index].singer
        if let image = UIImage(named: songName) {
            songImage.image = image
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        let fileUrl = Bundle.main.url(forResource: songName, withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        duration = CMTimeGetSeconds(playerItem.asset.duration)
        musicSlider.minimumValue = 0
        musicSlider.maximumValue = Float(duration)
        musicSlider.value = 0
        currentTimeLabel.text = "0:00"
        remainTimeLabel.text = "-\(formatTime(time: duration))"
        player.replaceCurrentItem(with: playerItem)
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = playerItem.currentTime().seconds
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = playerItem.asset.duration.seconds
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
        MPNowPlayingInfoCenter.default().nowPlayingInfo = self.nowPlayingInfo
    }
    
    func formatTime(time: Float64) -> String {
        let songLength = Int(time)
        let min = songLength / 60
        let sec = songLength % 60
        return String(format: "%d:%02d", min, sec)
    }
    
    func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player.rate == 0.0 {
                self.isPlaying = true
                self.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.isPlaying = false
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.changePlaybackPositionCommand.addTarget { [unowned self] event in
            if let remoteEvent = event as? MPChangePlaybackPositionCommandEvent {
                let time = CMTime(seconds: remoteEvent.positionTime, preferredTimescale: 1)
                self.player.seek(to: time)
                return .success
            }
            return .commandFailed
        }
        
        commandCenter.nextTrackCommand.addTarget { [unowned self](event) -> MPRemoteCommandHandlerStatus in
            
            if self.index == self.playList.count - 1, self.playType != "repeatAll" {
                self.isPlaying = false
                self.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            }
            self.index += 1
            self.index %= self.playList.count
            self.player.pause()
            self.prepareSong(index: self.index)
            self.play()
            return .success
        }
        
        commandCenter.previousTrackCommand.addTarget { [unowned self](event) -> MPRemoteCommandHandlerStatus in
            if self.player.currentTime().seconds < 4 {
                if self.self.index > 0 {
                    self.index -= 1
                } else if self.index == 0, self.playType == "repeatAll" {
                    self.index = self.playList.count - 1
                }
            }
            self.player.pause()
            self.prepareSong(index: self.index)
            self.play()
            return .success
        }
    }

    func addPeriodicTimeObserver() {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 1, preferredTimescale: timeScale)
        if timeObserverToken == nil {
            timeObserverToken = player.addPeriodicTimeObserver(forInterval: time, queue: .main, using: { (time) in
                if self.player.currentItem?.status == .readyToPlay, self.player.rate == 1 {
                    let currentTime = CMTimeGetSeconds((self.player.currentTime()))
                    self.musicSlider.value = Float(currentTime)
                    self.currentTimeLabel.text = self.formatTime(time: currentTime)
                    self.remainTimeLabel.text = "-\(String(describing: self.formatTime(time: Double((self.musicSlider.maximumValue)) - currentTime)))"
                    self.nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = currentTime
                    MPNowPlayingInfoCenter.default().nowPlayingInfo = self.nowPlayingInfo
                }
            })
        }
    }
    
    func removePeriodicTimeObserver() {
        if let timeObserverToken = timeObserverToken {
            player.removeTimeObserver(timeObserverToken)
            self.timeObserverToken = nil
        }
    }
}
