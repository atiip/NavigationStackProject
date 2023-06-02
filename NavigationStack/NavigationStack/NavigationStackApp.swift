//
//  NavigationStackApp.swift
//  NavigationStack
//
//  Created by Muhammad Athif on 31/05/23.
//

import SwiftUI

@main
struct NavigationStackApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(router)
        }
    }
}
