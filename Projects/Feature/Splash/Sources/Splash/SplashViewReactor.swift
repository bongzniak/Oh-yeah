//
//  SplashViewReactor.swift
//  Splash
//
//  Created by bongzniak on 2023/01/20.
//  Copyright © 2023 com.bongzniak. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class SplashViewReactor: Reactor {
  
    enum Action {
    }

    enum Mutation {
    }

    struct State {
    }

    let initialState: State
    
    private let coordinator: SplashCoordinator

    // MARK: Initializing
    
    init(splashCoordinator: SplashCoordinator) {
        initialState = State()
        
        coordinator = splashCoordinator
    }

    // MARK: Mutate

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        }
    }

    // MARK: Reduce

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        }

        return state
    }
}
