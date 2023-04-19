//
//  MainWidgetBundle.swift
//  MainWidget
//
//  Created by Mini001 on 2023/4/19.
//

import WidgetKit
import SwiftUI

@main
struct MainWidgetBundle: WidgetBundle {
    var body: some Widget {
        LockToolWidget()
        EnglishWordWidget()
        PeopleWordWidget()
    }
}
