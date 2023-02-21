//
//  PoluboiarinovTestProjectApp.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import SwiftUI

@main
struct PoluboiarinovTestProjectApp: App {
    
    @StateObject private var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            StartView().environmentObject(vm)
        }
    }
}
