//
//  VocabularyViewReactor.swift
//  Vocabulary
//
//  Created by bongzniak on 2023/01/20.
//  Copyright © 2023 com.bongzniak. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

import Core

final class VocabularyViewReactor: Reactor {
  
    enum Action {
        case refresh
    }

    enum Mutation {
        case setRefreshing(Bool)
        case updateSections([VocabularySection])
    }

    struct State {
        var sections: [VocabularySection] = [
            .section([
                .vocabulary(Vocabulary.random()),
                .vocabulary(Vocabulary.random()),
                .vocabulary(Vocabulary.random()),
                .vocabulary(Vocabulary.random()),
                .vocabulary(Vocabulary.random())
            ])
        ]
        @Pulse var isRefreshing: Bool = false
    }

    let initialState: State

    // MARK: Initializing
    
    init() {
        initialState = State()
    }
    
    // MARK: Mutate

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            return .concat([
                .just(.setRefreshing(true)),
                .just(.updateSections(
                    [
                        .section([
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random()),
                            .vocabulary(Vocabulary.random())
                        ])
                    ]
                )),
                .just(.setRefreshing(false))
            ])
        }
    }

    // MARK: Reduce

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
            case .setRefreshing(let isRefreshing):
                state.isRefreshing = isRefreshing
                
            case .updateSections(let sections):
                state.sections = sections
        }

        return state
    }
}
