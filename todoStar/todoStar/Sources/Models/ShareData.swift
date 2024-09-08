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
            let dummyData: [GoalRecordDataModel] = [
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "SwiftUI 튜토리얼 완성하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "레이아웃 기초 배우기", smallGoal: "VStack과 HStack 이해하기", goalPeriod: 2, goalStatus: 2, createdDate: Date(timeIntervalSince1970: 1700000000), completionGoal: true),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "수정자 이해하기", smallGoal: "기본 수정자 적용하기", goalPeriod: 2, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700003600), completionGoal: false)
                    ],
                    importance: "반드시 해야 해요!",
                    reward: "새로운 iPad",
                    progressStatus: false,
                    createdDate: Date(timeIntervalSince1970: 1699900000),
                    completionGoal: false
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "회의 발표 준비하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "슬라이드 작성하기", smallGoal: "슬라이드 디자인하기", goalPeriod: 3, goalStatus: 3, createdDate: Date(timeIntervalSince1970: 1700010000), completionGoal: true),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "자료 정리하기", smallGoal: "참고 자료 준비하기", goalPeriod: 3, goalStatus: 2, createdDate: Date(timeIntervalSince1970: 1700013600), completionGoal: false),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "자료 정리하기", smallGoal: "참고 자료 준비하기", goalPeriod: 3, goalStatus: 2, createdDate: Date(timeIntervalSince1970: 1700013600), completionGoal: false)
                    ],
                    importance: "반드시 해야 해요!",
                    reward: "커피 기프티콘",
                    progressStatus: true,
                    createdDate: Date(timeIntervalSince1970: 1699800000),
                    completionGoal: false
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "운동 루틴 설정하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "헬스장 등록하기", smallGoal: "주 3회 헬스장 가기", goalPeriod: 3, goalStatus: 3, createdDate: Date(timeIntervalSince1970: 1700020000), completionGoal: true),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "운동 계획 세우기", smallGoal: "매일 운동 계획 작성하기", goalPeriod: 3, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700023600), completionGoal: false)
                    ],
                    importance: "해야 하지만 급하지 않아요.",
                    reward: "운동화",
                    progressStatus: true,
                    createdDate: Date(timeIntervalSince1970: 1699700000),
                    completionGoal: false
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "주간 업무 정리하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "업무 목록 작성하기", smallGoal: "우선순위 매기기", goalPeriod: 2, goalStatus: 2, createdDate: Date(timeIntervalSince1970: 1700030000), completionGoal: true),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "진행 상황 점검하기", smallGoal: "업무 완료 여부 확인하기", goalPeriod: 2, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700033600), completionGoal: false)
                    ],
                    importance: "하고 싶지만 급하지 않아요.",
                    reward: "시간 관리 앱",
                    progressStatus: true,
                    createdDate: Date(timeIntervalSince1970: 1699600000),
                    completionGoal: false
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "여행 계획 세우기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "목적지 결정하기", smallGoal: "여행지 조사하기", goalPeriod: 1, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700040000), completionGoal: true)
                    ],
                    importance: "해야 하지만 급하지 않아요.",
                    reward: "여행용 캐리어",
                    progressStatus: true,
                    createdDate: Date(timeIntervalSince1970: 1699500000),
                    completionGoal: true
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "취미 활동 시작하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "취미 관련 자료 조사하기", smallGoal: "기본 도구 준비하기", goalPeriod: 2, goalStatus: 2, createdDate: Date(timeIntervalSince1970: 1700050000), completionGoal: true),
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "첫 번째 시도 하기", smallGoal: "간단한 프로젝트 완성하기", goalPeriod: 2, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700053600), completionGoal: false)
                    ],
                    importance: "해야 하지만 급하지 않아요.",
                    reward: "취미 관련 서적",
                    progressStatus: false,
                    createdDate: Date(timeIntervalSince1970: 1699400000),
                    completionGoal: false
                ),
                GoalRecordDataModel(
                    goalId: UUID(),
                    lastGoal: "온라인 강좌 수강하기",
                    middleGoal: [
                        MiddleGoalDataModel(middleGoalId: UUID(), middleGoal: "강좌 등록하기", smallGoal: "계획 세우기", goalPeriod: 1, goalStatus: 1, createdDate: Date(timeIntervalSince1970: 1700060000), completionGoal: true)
                    ],
                    importance: "반드시 해야 해요!",
                    reward: "자격증",
                    progressStatus: true,
                    createdDate: Date(timeIntervalSince1970: 1699300000),
                    completionGoal: true
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

