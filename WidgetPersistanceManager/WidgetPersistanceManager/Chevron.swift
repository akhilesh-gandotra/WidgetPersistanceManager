//
//  Chevron.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import Foundation

class Chevron: Widget {
    var rawValue: String = "chevron"
    var maxValue: Int = 2
    var isShowing = false
    var persistentEntity = PersistentEntity()
    
    init(maxValue: Int) {
        self.maxValue = maxValue
    }
    
    func canShowWidget() -> Bool {
        if persistentEntity.checkPersistentCountFor(key: rawValue) < maxValue, !persistentEntity.isWidgetInteracted(key: rawValue) {
            isShowing = true
            persistentEntity.incrementCountFor(key: rawValue)
            return true
        }
        isShowing = false
        return false
    }
    
    func widgetInteracted(callback: (() -> Void)?) {
        guard var widget = persistentEntity.dataFor(key: rawValue) else {
            return
        }
        widget.isInteracted = true
        persistentEntity.saveData(widget: widget, key: rawValue)
        callback?()
    }
}
