//
//  PersistantWidgetManager.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import Foundation

class WidgetPersistenceManager: WidgetPersistenceManageable {
    
    static let shared = WidgetPersistenceManager()
    
    private init() {}
    
    private var widgets = [String: Widget]()
    
    private func getWidget(rawValue: String) -> Widget {
        guard let widget = widgets[rawValue] else {
            fatalError("Widget must be added before fetching")
        }
        return widget
    }
    
    func canShowWidgetFor(rawValue: String) -> Bool {
        return getWidget(rawValue: rawValue).canShowWidget()
    }
    
    func add(widget: Widget) {
        if widgets[widget.rawValue] != nil {
            return
        }
        widgets[widget.rawValue] = widget
    }
    
    func removeWidgetWith(rawValue: String) {
        widgets.removeValue(forKey: rawValue)
    }
    
    func isWidgetInteracted(rawValue: String) -> Bool {
        return getWidget(rawValue: rawValue).persistentEntity.isInteracted
    }
    
    func widgetInteracted(rawValue: String, callback: (() -> Void)?) {
        getWidget(rawValue: rawValue).widgetInteracted(callback: callback)
    }
}
