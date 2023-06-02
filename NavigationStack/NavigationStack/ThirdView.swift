//
//  ThirdView.swift
//  NavigationStack
//
//  Created by Muhammad Athif on 31/05/23.
//

import SwiftUI

struct ThirdView: View {
    //    @Binding var path:[Int]
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack{
            Text("Welcome to third view")
            Button(action: {
                // Button action goes here
                //  path = []
                router.reset()
                
            }) {
                Text("Go back to root view")
                
            }
        }.navigationTitle("Third View")
    }
}

