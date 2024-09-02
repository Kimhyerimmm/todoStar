//
//  DataModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import Foundation
import SwiftData

@Model
class GoalRecordDataModel: Identifiable {
    var goalId: UUID
    var lastGoal: String
    var middleGoal: String
    var smallGoal: String
    var goalPeriod: Int
    var importance: String
    var reward: String
    var createdDate: Date
    
    init(goalId: UUID, lastGoal: String, middleGoal: String, smallGoal: String, goalPeriod: Int, importance: String, reward: String, createdDate: Date) {
        self.goalId = goalId
        self.lastGoal = lastGoal
        self.middleGoal = middleGoal
        self.smallGoal = smallGoal
        self.goalPeriod = goalPeriod
        self.importance = importance
        self.reward = reward
        self.createdDate = createdDate
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
