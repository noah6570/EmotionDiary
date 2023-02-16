//
//  HomeViewModel.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/14.
//

import Foundation

protocol ViewModelType {
    func calculateEmotionCount() -> Int
}

class EmotionHomeViewModel: ViewModelType {
    
    let navigationItemTitle: String = "감정일기"
    
    let totalCountInfo: String = "감정을 누른 총 횟수"

    var emotionInfoArray: [Emotion] = [Emotion(name: "good", count: 0, imageName: "😀"), Emotion(name: "veryGood", count: 0, imageName: "😄"), Emotion(name: "notbad", count: 0, imageName: "🙂"), Emotion(name: "happy", count: 0, imageName: "🤣"), Emotion(name: "sad", count: 0, imageName: "😭"), Emotion(name: "tired", count: 0, imageName: "😴")]
    
    // 접근제어자 알아보기
    public func calculateEmotionCount() -> Int {
        var totalCount = 0
        emotionInfoArray.forEach {
            let count = UserDefaults.standard.integer(forKey: $0.name)
            totalCount += count
        }
        
        return totalCount
    }
}

class FoodHomeViewModel: ViewModelType {
    func calculateEmotionCount() -> Int {
      return 0
    }
}
