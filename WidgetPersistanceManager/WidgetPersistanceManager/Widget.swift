//
//  Widget.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import Foundation


protocol Widget {
    var rawValue: String { get set }
    var maxValue: Int { get set }
    var persistentEntity: PersistentEntity { get set }
    
    func canShowWidget() -> Bool
    func widgetInteracted(callback: (() -> Void)?)
}

