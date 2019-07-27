//
//  CharacterViewModel.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 26/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RxSwift
import RxCocoa

class CharacterViewModel {
    
    // MARK: - Value
    let characters: BehaviorRelay<[CharacterProtocol]> = BehaviorRelay(value: [])
    let error: PublishSubject<String> = PublishSubject()
    var shouldLoadNextPage: Bool = false
    private var page = 0
    
    // MARK: - Methods
    
    func getCharacters() {
        shouldLoadNextPage = false
        CharacterService().getCharactersFor(page: page, completionHandler: { [weak self] characters in
            self?.update(characters: characters)
            }, errorHandler: { [weak self] error in 
                if let error = error {
                    self?.error.onNext(error)
                }
        })
    }
    
    // MARK: - Private methods
    
    private func update(characters: [CharacterProtocol]) {
        let previousValue = self.characters.value
        self.characters.accept(previousValue + characters)
        page += 1
        shouldLoadNextPage = true
    }
}
