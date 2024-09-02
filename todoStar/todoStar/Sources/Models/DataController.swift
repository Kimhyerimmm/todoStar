//
//  DataController.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//  Created by Minyoung Yoo
//

import Foundation
import SwiftData

class DBController {
    typealias GoalDataModelType = GoalRecordDataModel
    typealias AccomplishmentDataModelType = AccomplishmentRecordDataModel
    typealias AchievementDataModelType = AchievementRecordDataModel
    
    // 싱글톤
    static var shared = DBController()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            self.container = try ModelContainer(for: GoalDataModelType.self,
                                                AccomplishmentDataModelType.self,
                                                AchievementDataModelType.self)
            if let container = self.container {
                self.context = ModelContext(container)
            }
        } catch {
            print(error)
        }
    }
    
    // MARK: - 데이터 삽입
    func insertGoalData(data: GoalDataModelType) {
        if let context = self.context {
            context.insert(data)
            print("데이터 저장 완료")
        }
    }
    
    func insertAccomplishmentData(data: AccomplishmentDataModelType) {
        if let context = self.context {
            context.insert(data)
            print("데이터 저장 완료")
        }
    }
    
    func insertAchievementData(data: AchievementDataModelType) {
        if let context = self.context {
            context.insert(data)
            print("데이터 저장 완료")
        }
    }
    
    // MARK: - 데이터 불러오기
    func fetchGoalData(completion: @escaping ([GoalDataModelType]?, Error?) -> ()) {
        let descriptor = FetchDescriptor<GoalDataModelType>(
            sortBy: [
                .init(\.createdDate, order: .reverse)
            ]
        )
        
        if let context = self.context {
            do {
                let data = try context.fetch(descriptor)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func fetchAccomplishmentData(completion: @escaping ([AccomplishmentDataModelType]?, Error?) -> ()) {
        let descriptor = FetchDescriptor<AccomplishmentDataModelType>(
            sortBy: [
                .init(\.createdDate, order: .reverse)
            ]
        )
        
        if let context = self.context {
            do {
                let data = try context.fetch(descriptor)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func fetchAchievementData(completion: @escaping ([AchievementDataModelType]?, Error?) -> ()) {
        let descriptor = FetchDescriptor<AchievementDataModelType>(
            sortBy: [
                .init(\.achievementDate, order: .reverse)
            ]
        )
        
        if let context = self.context {
            do {
                let data = try context.fetch(descriptor)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    // MARK: - 데이터 수정하기
    func updateGoalData(model: GoalDataModelType, data: GoalDataModelType) {
        let dataToBeUpdated = model
        dataToBeUpdated.goalId = data.goalId
        dataToBeUpdated.lastGoal = data.lastGoal
        dataToBeUpdated.middleGoal = data.middleGoal
        dataToBeUpdated.smallGoal = data.smallGoal
        dataToBeUpdated.goalPeriod = data.goalPeriod
        dataToBeUpdated.importance = data.importance
        dataToBeUpdated.reward = data.reward
    }
    
    func updateAccomplishmentData(model: AccomplishmentDataModelType, data: AccomplishmentDataModelType) {
        let dataToBeUpdated = model
        dataToBeUpdated.accomplishmentId = data.accomplishmentId
        dataToBeUpdated.accomplishmentImpressions = data.accomplishmentImpressions
        dataToBeUpdated.accomplishmentEmotion = data.accomplishmentEmotion
        dataToBeUpdated.selfCompliment = data.selfCompliment
        dataToBeUpdated.selfCheering = data.selfCheering
        dataToBeUpdated.createdDate = data.createdDate
    }
    
    func updateAchievementData(model: AchievementDataModelType, data: AchievementDataModelType) {
        let dataToBeUpdated = model
        dataToBeUpdated.achievementId = data.achievementId
        dataToBeUpdated.achievementGoal = data.achievementGoal
        dataToBeUpdated.achievementImpressions = data.achievementImpressions
        dataToBeUpdated.achievementDate = data.achievementDate
        dataToBeUpdated.goalId = data.goalId
    }
    
    // MARK: - 데이터 삭제하기
    func deleteGoalData(model: GoalDataModelType) {
        let dataToBeDeleted = model
        if let context = self.context {
            context.delete(dataToBeDeleted)
        }
    }
    
    func deleteAccomplishmentData(model: AccomplishmentDataModelType) {
        let dataToBeDeleted = model
        if let context = self.context {
            context.delete(dataToBeDeleted)
        }
    }
    
    func deleteAchievementData(model: AchievementDataModelType) {
        let dataToBeDeleted = model
        if let context = self.context {
            context.delete(dataToBeDeleted)
        }
    }
}
