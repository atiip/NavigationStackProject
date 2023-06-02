//
//  Router.swift
//  NavigationStack
//
//  Created by Muhammad Athif on 01/06/23.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset(){
        self.path = NavigationPath()
    }
}
