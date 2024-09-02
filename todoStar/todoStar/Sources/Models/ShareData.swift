//
//  ShareData.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import Foundation

class ShareData {
    static let shared = ShareData()
    private let dbController = DBController.shared
    
    // MARK: - 데이터 저장 배열
    private var goalData: [GoalRecordDataModel] = []
    private var accomplishmentData: [AccomplishmentRecordDataModel] = []
    private var achievementData: [AchievementRecordDataModel] = []
    
    // MARK: - 초기 데이터 로드
    private init() {
        loadGoalData()
        loadAccomplishmentData()
        loadAchievementData()
    }
    
    // MARK: - 데이터 로드: 데이터가 nil이 아니면 해당 데이터 배열에 저장
    private func loadGoalData() {
        dbController.fetchGoalData { [ weak self ] data, error in
            if let data = data {
                self?.goalData = data
            } else {
                print(String(describing: error?.localizedDescription))
            }
        }
    }
    
    private func loadAccomplishmentData() {
        dbController.fetchAccomplishmentData { [ weak self ] data, error in
            if let data = data {
                self?.accomplishmentData = data
            } else {
                print(String(describing: error?.localizedDescription))
            }
        }
    }
    
    private func loadAchievementData() {
        dbController.fetchAchievementData { [ weak self ] data, error in
            if let data = data {
                self?.achievementData = data
            } else {
                print(String(describing: error?.localizedDescription))
            }
        }
    }
    
    // MARK: - 데이터 접근
    private func getGoalData() -> [GoalRecordDataModel] {
        return goalData
    }
    
    private func getAccomplishmentData() -> [AccomplishmentRecordDataModel] {
        return accomplishmentData
    }
    
    private func getAchievementData() -> [AchievementRecordDataModel] {
        return achievementData
    }
    
    // MARK: - 데이터 삽입
    private func addGoalData(data: GoalRecordDataModel) {
        goalData.append(data)
        dbController.insertGoalData(data: data)
    }
    
    private func addAccomplishmentData(data: AccomplishmentRecordDataModel) {
        accomplishmentData.append(data)
        dbController.insertAccomplishmentData(data: data)
    }
    
    private func addAchievementData(data: AchievementRecordDataModel) {
        achievementData.append(data)
        dbController.insertAchievementData(data: data)
    }
    
    // MARK: - 데이터 업데이트
    private func updateGoalData(model: GoalRecordDataModel, data: GoalRecordDataModel) {
        if let index = goalData.firstIndex(where: { $0.goalId == model.goalId }) { // 배열에서 조건에 맞는 인덱스 중 받아온 모델의 id와 같은 인덱스의 배열 찾기
            goalData[index] = data // 데이터 업데이트
            dbController.updateGoalData(model: model, data: data) // 컨트롤러 데이터 업데이트
        }
    }
    
    private func updateAccomplishmentData(model: AccomplishmentRecordDataModel, data: AccomplishmentRecordDataModel) {
        if let index = accomplishmentData.firstIndex(where: { $0.accomplishmentId == model.accomplishmentId }) {
            accomplishmentData[index] = data
            dbController.updateAccomplishmentData(model: model, data: data)
        }
    }
    
    private func updateAchievementData(model: AchievementRecordDataModel, data: AchievementRecordDataModel) {
        if let index = achievementData.firstIndex(where: { $0.achievementId == model.achievementId }) {
            achievementData[index] = data
            dbController.updateAchievementData(model: model, data: data)
        }
    }
    
    // MARK: - 데이터 삭제
    private func deleteGoalData(model: GoalRecordDataModel) {
        if let index = goalData.firstIndex(where: { $0.goalId == model.goalId }) { // 배열에서 조건에 맞는 인덱스 중 받아온 모델의 id와 같은 인덱스의 배열 찾기
            goalData.remove(at: index)
            dbController.deleteGoalData(model: model) // 컨트롤러 데이터 업데이트
        }
    }
    
    private func deleteAccomplishmentData(model: AccomplishmentRecordDataModel) {
        if let index = accomplishmentData.firstIndex(where: { $0.accomplishmentId == model.accomplishmentId }) {
            accomplishmentData.remove(at: index)
            dbController.deleteAccomplishmentData(model: model)
        }
    }
    
    private func deleteAchievementData(model: AchievementRecordDataModel) {
        if let index = achievementData.firstIndex(where: { $0.achievementId == model.achievementId }) {
            achievementData.remove(at: index)
            dbController.deleteAchievementData(model: model)
        }
    }
}
