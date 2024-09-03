//
//  GoalMainViewModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

struct CurrentGoalModel {
    let goalId: UUID
    let middleGoal: String
    let smallGoal: String
    let importance: String
    let period: Int
}

class GoalMainViewModel {
    private let shareData = ShareData.shared
    typealias goalData = CurrentGoalModel
    
    var currentGoals: [goalData] = []
    
    init() {
        loadCurrentGoal()
    }
    
    func loadCurrentGoal() {
        let goalData = shareData.getGoalData()
        // 데이터 변환 로직: 여기서는 간단한 변환을 예로 듭니다
        currentGoals = goalData.map { CurrentGoalModel(goalId: $0.goalId, middleGoal: $0.middleGoal, smallGoal: $0.smallGoal, importance: $0.importance, period: $0.goalPeriod) }
        loadSampleData()
    }
    
    // MARK: - 임시 데이터
    private let sampleGoals: [goalData] = [
        goalData(
            goalId: UUID(uuidString: "e0b1d5c4-7f3e-4b57-b4e5-5a8b3e5c2f2a")!,
            middleGoal: "매일 영어로 30분씩 대화하기",
            smallGoal: "매일 영어 단어 10개 외우기",
            importance: "높음",
            period: 6
        ),
        goalData(
            goalId: UUID(uuidString: "a3c4e7b1-2d1f-4d68-8f89-3c9b5b6c1a1d")!,
            middleGoal: "주 3회 운동하기",
            smallGoal: "매일 물 2리터 마시기",
            importance: "중간",
            period: 3
        ),
        goalData(
            goalId: UUID(uuidString: "f8e7d3a5-1b4c-4b7e-9d8a-2e5c6d7a8b9f")!,
            middleGoal: "매주 1개 모듈 완성하기",
            smallGoal: "매일 2시간 작업하기",
            importance: "높음",
            period: 2
        )
    ]
    
    // MARK: - Sample Data Load
    private func loadSampleData() {
        // Sample data 로드 (임시 데이터 추가)
        currentGoals = sampleGoals
    }
}

