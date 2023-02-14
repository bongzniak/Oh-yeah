//
//  SaveVocabularyCoordinator.swift
//  VocabularyDemoApp
//
//  Created by bongzniak on 2023/02/06.
//  Copyright © 2023 com.bongzniak. All rights reserved.
//

import Foundation
import UIKit

import Core
import Group


protocol BaseSaveVocabularyCoordinator: Coordinator {
    func pushToGroup(selectMode: SelectMode, selectIDs: Set<String>)
    func close()
}

// Coordinator <-> Reactor
public protocol SaveVocabularyCoordinatorDelegate: AnyObject {
    func selectedGroups(_ groups: [Group])
}

public final class SaveVocabularyCoordinator: BaseCoordinator, BaseSaveVocabularyCoordinator {
    
    public weak var parentCoordinator: Coordinator?
    public var navigationController: UINavigationController
    
    public weak var delegate: SaveVocabularyCoordinatorDelegate?
    var rootNavigationController: UINavigationController
    
    // MARK: Initializer
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        self.rootNavigationController = UINavigationController()
        self.rootNavigationController.modalPresentationStyle = .fullScreen
    }
    
    public func start() {
        let viewController = SaveVocabularyViewController.instance(coordinator: self)
        rootNavigationController.viewControllers = [viewController]
        navigationController.present(rootNavigationController, animated: true)
    }
    
    public func close() {
        navigationController.dismiss(animated: true)
    }
    
    public func pushToGroup(selectMode: SelectMode, selectIDs: Set<String>) {
        let coordinator = GroupsCoordinator(navigationController: rootNavigationController)
        coordinator.parentCoordinator = self
        coordinator.delegate = self
        
        coordinator.start()
    }
}

extension SaveVocabularyCoordinator: GroupsCoordinatorDelegate {
    public func selectedGroups(_ groups: [Group]) {
        delegate?.selectedGroups(groups)
    }
}
