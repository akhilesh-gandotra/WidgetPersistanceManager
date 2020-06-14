//
//  PersistantEntity.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import Foundation


struct PersistentEntity: Codable {
    var count: Int
    var isInteracted: Bool

    init(count: Int = 0, isInteracted: Bool = false) {
        self.count = count
        self.isInteracted = isInteracted
    }
}


extension PersistentEntity {
    func isWidgetInteracted(key: String) -> Bool {
        guard let widget = dataFor(key: key), widget.isInteracted else {
            return false
        }
        return true
    }

    func checkPersistentCountFor(key: String) -> Int {
        guard let widget = dataFor(key: key) else {
            return 0
        }
        return widget.count
    }

    func incrementCountFor(key: String) {
        guard var widget = dataFor(key: key) else {
            let onboardingWidget = PersistentEntity(count: 1, isInteracted: false)
            saveData(widget: onboardingWidget, key: key)
            return
        }
        widget.count += 1
        saveData(widget: widget, key: key)
    }

    func saveData(widget: PersistentEntity, key: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(widget), forKey: key)
    }

    func dataFor(key: String) -> PersistentEntity? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data, let decodedWidget = try? PropertyListDecoder().decode(PersistentEntity.self, from: data) else {
            return nil
        }
        return decodedWidget
    }
}
