//
//  ChatConstants.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import Foundation

struct ChatConstants {
    static let chatCell = "ChatCell"
    static let answerCell = "ChatAnswerCell"
    static let answers = ["Tell me about yourself", "Where do you film?", "Which comics do you join?", "Where can I find you?"]
    static let descriptionDefault = "It's nothing interesting"
    static let comicsDefault = "I'm not sure about it"
    static let seriesDefault = "I'm not filmed yet"
    static let storiesDefault = "In some stories, but I don't know where exactly"
    static let defaultName = "Super Hero"
    
    enum AnswerType: Int {
        case description
        case comics
        case series
        case stories
    }
    
    enum EntryType: String {
        case hello = "Hello"
        case introduce = "I'm "
        case see = "You can see me in "
        case comics = " comics"
        case series = " series"
        case stories = " stories"
        case example = "For example"
    }
}
