//
//  ChatViewModel.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxCocoa
import RxSwift

class ChatViewModel {
    
    // MARK: - Value
    
    let character: BehaviorRelay<CharacterProtocol>
    let anwers: BehaviorRelay<[String]> = BehaviorRelay(value: ChatConstants.answers)
    var messages: BehaviorRelay<[Message]> = BehaviorRelay(value: [])
    private lazy var messageService = MessageService()
    
    required init(character: CharacterProtocol) {
        self.character = BehaviorRelay(value: character)
        getSavedMessages()
    }
    
    // MARK: - Methods
    
    func sendAnswerFor(index: Int) {
        sendMessage(text: anwers.value[index], type: .sent)
        guard let type = ChatConstants.AnswerType(rawValue: index) else { return }
        sendMessage(text: prepareAnswerText(for: type), type: .received)
    }
    
    func getLastCellRow() -> Int {
        return messages.value.count - 1
    }
    
    // MARK: - Private methods

    private func prepareAnswerText(for type: ChatConstants.AnswerType) -> String {
        switch type {
        case .description:
            guard let description = character.value.description else {
                return ChatConstants.descriptionDefault
            }
            return description.isEmpty ? ChatConstants.descriptionDefault : description
        case .comics:
            guard let comicsCount = character.value.comics?.available,
                comicsCount != 0,
                let items = character.value.comics?.items else {
                    return ChatConstants.comicsDefault
            }
            return getAnswer(data: items, 
                             endAnswer: ChatConstants.EntryType.comics.rawValue)
        case .series:
            guard let seriesCount = character.value.series?.available,
                seriesCount != 0,
                let items = character.value.series?.items else {
                    return ChatConstants.seriesDefault
            } 
            return getAnswer(data: items, 
                             endAnswer: ChatConstants.EntryType.series.rawValue)
        case .stories:
            guard let storiesCount = character.value.stories?.available,
                storiesCount != 0,
                let items = character.value.stories?.items else {
                    return ChatConstants.descriptionDefault
            }
            return getAnswer(data: items, 
                             endAnswer: ChatConstants.EntryType.stories.rawValue)
        }
    }
    
    private func getAnswer(data: [CharacterDataItem], endAnswer: String) -> String {
        let count = data.count > 5 ? 5 : data.count
        var answers: [String] = [
            ChatConstants.EntryType.see.rawValue + String(count) + endAnswer,
            ChatConstants.EntryType.example.rawValue
        ]
        for index in 0..<count {
            if let element = data[index].name {
                answers.append(element)
            }
        }
        return answers.joined(separator: " \n")
    }

    private func sendMessage(text: String, type: MessageType) {
        let message = Message(text: text, type: type)
        messageService.sendMessage(characterId: character.value.id, 
                                   message: message)
        messages.accept(messages.value + [message])
    }
    
    private func getSavedMessages() {
        let messages = messageService.getMessages(characterId: character.value.id)
        messages.isEmpty ? sayHello() : self.messages.accept(messages)
    }
    
    private func sayHello() {
        sendMessage(text: ChatConstants.EntryType.hello.rawValue, 
                    type: .received)
        sendMessage(text: ChatConstants.EntryType.introduce.rawValue + (character.value.name ?? ChatConstants.defaultName), 
                    type: .received)
    }
}
