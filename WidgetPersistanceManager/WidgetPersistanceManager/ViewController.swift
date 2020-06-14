//
//  ViewController.swift
//  WidgetPersistanceManager
//
//  Created by Akhilesh Gandotra on 14/06/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var chevron: Widget!
    var widgetManager: WidgetPersistenceManageable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        widgetManager = WidgetPersistenceManager.shared
        
        chevron = Chevron(maxValue: 3)
        widgetManager.add(widget: chevron)
    }
    
    func checkForChevronAnimation() -> Bool {
        return widgetManager.canShowWidgetFor(rawValue: chevron.rawValue)
    }

    func stopChevronAnimation() {
        widgetManager.widgetInteracted(rawValue: chevron.rawValue) {
           // some work
            print("work done")
        }
    }
}

