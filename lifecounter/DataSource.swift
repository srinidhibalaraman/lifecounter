//
//  DataSource.swift
//  LifeCounter
//
//  Created by Srinidhi Balaraman on 4/19/22.
//

import Foundation
class DataSource {
    
    private(set) var score = 0
    private(set) var score2 = 0
    
    init() {
        score = 20
        score2 = 20
    }
    
    func increaseScore() {
        score += 1
    }
    
    func decreaseScore() {
        score -= 1
    }
    
    func increaseScoreFive() {
        score += 5
    }
    
    func decreaseScoreFive() {
        score -= 5
    }
    
    func increaseScore2() {
        score2 += 1
    }
    
    func decreaseScore2() {
        score2 -= 1
    }
    
    func increaseScoreFive2() {
        score2 += 5
    }
    
    func decreaseScoreFive2() {
        score2 -= 5
    }
}
