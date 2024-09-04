//
//  ShareData.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import Foundation

class ShareData {
    private let dbController = DBController.shared
    static let shared = ShareData()
    
    // MARK: - 데이터 저장 배열
    private var goalData: [GoalRecordDataModel] = []
    private var middleGoalData: [MiddleGoalDataModel] = []
    private var accomplishmentData: [AccomplishmentRecordDataModel] = []
    private var achievementData: [AchievementRecordDataModel] = []


    // MARK: - 초기 데이터 로드
    private init() {
        dbController.clearAllData() // 더미데이터가 안 사라질 때 사용
        loadGoalData()
        loadMiddleGoalData()
        loadAccomplishmentData()
        loadAchievementData()

        // MARK: - 임시 데이터
        if goalData.isEmpty { // 데이터가 없을 때만 더미 데이터를 추가합니다.
            let dummyData = [
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "Swift 프로젝트 완성",
                    middleGoal: [
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "코어 데이터 구현",
                            smallGoal: "데이터 모델 생성",
                            goalPeriod: 7,
                            goalStatus: 7,
                            createdDate: Date()
                        ),
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "UI 빌드",
                            smallGoal: "사용자 인터페이스 디자인",
                            goalPeriod: 10,
                            goalStatus: 7,
                            createdDate: Date()
                        )
                    ],
                    importance: "높음",
                    reward: "주말 여행",
                    progressStatus: true,
                    createdDate: Date()
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "마라톤 준비",
                    middleGoal: [
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "지구력 증가",
                            smallGoal: "매일 5K 달리기",
                            goalPeriod: 14,
                            goalStatus: 7,
                            createdDate: Date()
                        ),
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "속도 향상",
                            smallGoal: "인터벌 트레이닝",
                            goalPeriod: 10,
                            goalStatus: 7,
                            createdDate: Date()
                        )
                    ],
                    importance: "중간",
                    reward: "새로운 러닝화",
                    progressStatus: true,
                    createdDate: Date()
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "새로운 언어 배우기",
                    middleGoal: [
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "기초 마스터",
                            smallGoal: "초급 과정 완료",
                            goalPeriod: 30,
                            goalStatus: 7,
                            createdDate: Date()
                        ),
                        MiddleGoalDataModel(
                            middleGoalId: UUID(),
                            middleGoal: "매일 연습",
                            smallGoal: "매일 말하기 연습",
                            goalPeriod: 60,
                            goalStatus: 7,
                            createdDate: Date()
                        )
                    ],
                    importance: "높음",
                    reward: "언어 교환 여행",
                    progressStatus: false,
                    createdDate: Date()
                )
            ]

            for data in dummyData {
                addGoalData(data: data) // goalData 배열에 추가 및 데이터베이스 저장
            }
        }
    }
    
    // MARK: - 데이터 로드: 데이터가 nil이 아니면 해당 데이터 배열에 저장
    public func loadGoalData() {
        dbController.fetchGoalData { [weak self] data, error in
            if let data = data {
                self?.goalData = data
            } else {
                print("loadGoalData: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    public func loadMiddleGoalData() {
        dbController.fetchMiddleGoalData { [ weak self ] data, error in
            if let data = data {
                self?.middleGoalData = data
            } else {
                print("loadMiddleGoalData: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    public func loadAccomplishmentData() {
        dbController.fetchAccomplishmentData { [ weak self ] data, error in
            if let data = data {
                self?.accomplishmentData = data
            } else {
                print(String(describing: error?.localizedDescription))
            }
        }
    }
    
    public func loadAchievementData() {
        dbController.fetchAchievementData { [ weak self ] data, error in
            if let data = data {
                self?.achievementData = data
            } else {
                print(String(describing: error?.localizedDescription))
            }
        }
    }
    
    // MARK: - 데이터 접근
    public func getGoalData() -> [GoalRecordDataModel] {
        return goalData
    }
    
    public func getMiddleGoalData() -> [MiddleGoalDataModel] {
        return middleGoalData
    }
    
    public func getAccomplishmentData() -> [AccomplishmentRecordDataModel] {
        return accomplishmentData
    }
    
    public func getAchievementData() -> [AchievementRecordDataModel] {
        return achievementData
    }
    
    // MARK: - 데이터 삽입
    public func addGoalData(data: GoalRecordDataModel) {
        goalData.append(data)
        dbController.insertGoalData(data: data)
    }
    
    public func addMiddleGoalData(data: MiddleGoalDataModel) {
        middleGoalData.append(data)
        dbController.insertMiddleGoalData(data: data)
    }
    
    public func addAccomplishmentData(data: AccomplishmentRecordDataModel) {
        accomplishmentData.append(data)
        dbController.insertAccomplishmentData(data: data)
    }
    
    public func addAchievementData(data: AchievementRecordDataModel) {
        achievementData.append(data)
        dbController.insertAchievementData(data: data)
    }
    
    // MARK: - 데이터 업데이트
    public func updateGoalData(model: GoalRecordDataModel, data: GoalRecordDataModel) {
        if let index = goalData.firstIndex(where: { $0.goalId == model.goalId }) { // 배열에서 조건에 맞는 인덱스 중 받아온 모델의 id와 같은 인덱스의 배열 찾기
            goalData[index] = data // 데이터 업데이트
            dbController.updateGoalData(model: model, data: data) // 컨트롤러 데이터 업데이트
        }
    }
    
    public func updateMiddleGoalData(model: MiddleGoalDataModel, data: MiddleGoalDataModel) {
        if let index = middleGoalData.firstIndex(where: { $0.middleGoalId == model.middleGoalId }) {
            middleGoalData[index] = data
            dbController.updateMiddleGoalData(model: model, data: data)
        }
    }
    
    public func updateAccomplishmentData(model: AccomplishmentRecordDataModel, data: AccomplishmentRecordDataModel) {
        if let index = accomplishmentData.firstIndex(where: { $0.accomplishmentId == model.accomplishmentId }) {
            accomplishmentData[index] = data
            dbController.updateAccomplishmentData(model: model, data: data)
        }
    }
    
    public func updateAchievementData(model: AchievementRecordDataModel, data: AchievementRecordDataModel) {
        if let index = achievementData.firstIndex(where: { $0.achievementId == model.achievementId }) {
            achievementData[index] = data
            dbController.updateAchievementData(model: model, data: data)
        }
    }
    
    // MARK: - 데이터 삭제
    public func deleteGoalData(model: GoalRecordDataModel) {
        if let index = goalData.firstIndex(where: { $0.goalId == model.goalId }) { // 배열에서 조건에 맞는 인덱스 중 받아온 모델의 id와 같은 인덱스의 배열 찾기
            goalData.remove(at: index)
            dbController.deleteGoalData(model: model) // 컨트롤러 데이터 업데이트
        }
    }
    
    public func deleteMiddleGoalData(model: MiddleGoalDataModel) {
        if let index = middleGoalData.firstIndex(where: { $0.middleGoalId == model.middleGoalId }) {
            middleGoalData.remove(at: index)
            dbController.deleteMiddleGoalData(model: model)
        }
    }
    
    public func deleteAccomplishmentData(model: AccomplishmentRecordDataModel) {
        if let index = accomplishmentData.firstIndex(where: { $0.accomplishmentId == model.accomplishmentId }) {
            accomplishmentData.remove(at: index)
            dbController.deleteAccomplishmentData(model: model)
        }
    }
    
    public func deleteAchievementData(model: AchievementRecordDataModel) {
        if let index = achievementData.firstIndex(where: { $0.achievementId == model.achievementId }) {
            achievementData.remove(at: index)
            dbController.deleteAchievementData(model: model)
        }
    }
}

