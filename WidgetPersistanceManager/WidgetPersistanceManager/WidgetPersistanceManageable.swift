//
//  WidgetPersistanceManageable.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import Foundation


protocol WidgetPersistenceManageable {
    func add(widget: Widget)
    func removeWidgetWith(rawValue: String)
    func canShowWidgetFor(rawValue: String) -> Bool
    func isWidgetInteracted(rawValue: String) -> Bool
    func widgetInteracted(rawValue: String, callback: (() -> Void)?)
}
