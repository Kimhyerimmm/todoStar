//
//  DataModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import Foundation
import SwiftData

@Model
class GoalRecordDataModel: Identifiable, CustomStringConvertible {
    var goalId: UUID
    var lastGoal: String
    var middleGoal: [MiddleGoalDataModel]
    var importance: String
    var reward: String
    var progressStatus: Bool
    var goalPeriod: Int
    var goalStatus: Int
    var createdDate: Date
    var completionGoal: Bool

    init(goalId: UUID, lastGoal: String, middleGoal: [MiddleGoalDataModel], importance: String, reward: String, progressStatus: Bool, createdDate: Date, completionGoal: Bool = false) {
        self.goalId = goalId
        self.lastGoal = lastGoal
        self.middleGoal = middleGoal
        self.importance = importance
        self.reward = reward
        self.progressStatus = progressStatus
        self.goalPeriod = middleGoal.count
        self.goalStatus = middleGoal.filter { $0.completionGoal }.count
        self.createdDate = createdDate
        self.completionGoal = completionGoal
    }

    var description: String {
        return "GoalRecordDataModel\nlastGoal: \(lastGoal),\n middleGoal: \(middleGoal),\n middleGoalCount: \(middleGoal.count),\n importance: \(importance),\n reward: \(reward),\n progressStatus: \(progressStatus))"
    }
}

@Model
class MiddleGoalDataModel: Identifiable, CustomStringConvertible {
    var middleGoalId: UUID
    var middleGoal: String
    var smallGoal: String
    var goalPeriod: Int
    var goalStatus: Int
    var createdDate: Date
    var completionGoal: Bool

    init(middleGoalId: UUID, middleGoal: String, smallGoal: String, goalPeriod: Int, goalStatus: Int = 0, createdDate: Date, completionGoal: Bool = false) {
        self.middleGoalId = middleGoalId
        self.middleGoal = middleGoal
        self.smallGoal = smallGoal
        self.goalPeriod = goalPeriod
        self.goalStatus = goalStatus
        self.createdDate = createdDate
        self.completionGoal = completionGoal
    }

    var description: String {
        return "MiddleGoalDataModel\nmiddleGoal: \(middleGoal),\n smallGoal: \(smallGoal),\n goalPeriod: \(goalPeriod))"
    }
}

@Model
class AccomplishmentRecordDataModel: Identifiable {
    var accomplishmentId: UUID
    var accomplishmentImpressions: String
    var accomplishmentEmotion: String
    var selfCompliment: String
    var selfCheering: String
    var createdDate: Date
    
    init(accomplishmentId: UUID, accomplishmentImpressions: String, accomplishmentEmotion: String, selfCompliment: String, selfCheering: String, createdDate: Date) {
        self.accomplishmentId = accomplishmentId
        self.accomplishmentImpressions = accomplishmentImpressions
        self.accomplishmentEmotion = accomplishmentEmotion
        self.selfCompliment = selfCompliment
        self.selfCheering = selfCheering
        self.createdDate = createdDate
    }
}

@Model
class AchievementRecordDataModel: Identifiable {
    var achievementId: UUID
    var achievementGoal: String
    var achievementImpressions: String
    var achievementDate: Date
    var goalId: UUID
    
    init(achievementId: UUID, achievementGoal: String, achievementImpressions: String, achievementDate: Date, goalId: UUID) {
        self.achievementId = achievementId
        self.achievementGoal = achievementGoal
        self.achievementImpressions = achievementImpressions
        self.achievementDate = achievementDate
        self.goalId = goalId
    }
}
