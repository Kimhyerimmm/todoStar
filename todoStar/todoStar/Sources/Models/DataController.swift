
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
    typealias MiddleGoalDataModelType = MiddleGoalDataModel
    typealias AccomplishmentDataModelType = AccomplishmentRecordDataModel
    typealias AchievementDataModelType = AchievementRecordDataModel

    // 싱글톤
    static let shared = DBController()
    var container: ModelContainer?
    var context: ModelContext?

    init() {
        do {
            self.container = try ModelContainer(for: GoalDataModelType.self,
                                                MiddleGoalDataModelType.self,
                                                AccomplishmentDataModelType.self,
                                                AchievementDataModelType.self)
            if let container = self.container {
                self.context = ModelContext(container)
            }
        } catch {
            print("do: \(error)")
        }
    }

    // MARK: - 데이터 삽입
    func insertGoalData(data: GoalDataModelType) {
        if let context = self.context {
            context.insert(data)
            print("데이터 저장 완료")
        }
    }

    func insertMiddleGoalData(data: MiddleGoalDataModelType) {
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

    func fetchMiddleGoalData(completion: @escaping ([MiddleGoalDataModelType]?, Error?) -> ()) {
        let descriptor = FetchDescriptor<MiddleGoalDataModelType>(
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
        dataToBeUpdated.importance = data.importance
        dataToBeUpdated.reward = data.reward
        dataToBeUpdated.progressStatus = data.progressStatus
        dataToBeUpdated.createdDate = data.createdDate
        dataToBeUpdated.completionGoal = data.completionGoal
    }

    func updateMiddleGoalData(model: MiddleGoalDataModelType, data: MiddleGoalDataModelType) {
        let dataToBeUpdated = model
        dataToBeUpdated.middleGoalId = data.middleGoalId
        dataToBeUpdated.middleGoal = data.middleGoal
        dataToBeUpdated.smallGoal = data.smallGoal
        dataToBeUpdated.goalPeriod = data.goalPeriod
        dataToBeUpdated.goalStatus = data.goalStatus
        dataToBeUpdated.createdDate = data.createdDate
        dataToBeUpdated.completionGoal = data.completionGoal
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

    func deleteMiddleGoalData(model: MiddleGoalDataModelType) {
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

    // MARK: - 모든 데이터 삭제하기
    func clearAllData() {
        // 각 엔티티에 대한 데이터를 삭제합니다.
        deleteAllData(for: GoalDataModelType.self)
        deleteAllData(for: MiddleGoalDataModelType.self)
        deleteAllData(for: AccomplishmentDataModelType.self)
        deleteAllData(for: AchievementDataModelType.self)
    }

    private func deleteAllData<T: PersistentModel>(for modelType: T.Type) {
        let descriptor = FetchDescriptor<T>()

        if let context = self.context {
            do {
                let data = try context.fetch(descriptor)
                for object in data {
                    context.delete(object)
                }
                print("Successfully deleted all data for \(modelType)")
            } catch {
                print("Failed to delete all data for \(modelType): \(error)")
            }
        }
    }
}
