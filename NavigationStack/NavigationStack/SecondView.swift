//
//  SecondView.swift
//  NavigationStack
//
//  Created by Muhammad Athif on 31/05/23.
//

import SwiftUI

struct SecondView: View {
    //    @Binding var path:[Int]
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack{
            Text("Welcome to second view")
            Button(action: {
                // Button action goes here
                
            }) {
                NavigationLink(destination:ThirdView()) {
                    Text("Go to third view")
                }
            }.simultaneousGesture(TapGesture().onEnded {
                // Button action can also go here
                // path.append(3)
            })
            // Solution 1 for Multi-Level NavigationStack
            NavigationLink(value: 3.0){
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green)
                        .frame(width: 200, height: 50)
                    Text("Go To Third View")
                        .foregroundColor(.white)
                }
            }
            .navigationDestination(for: Double.self){ _ in
                ThirdView().environmentObject(router)
            }
            
            // Solution 2 for Multi-Level NavigationStack
            Button(action: {
                router.path.append(2)
            }) {
                Text("Go to third view")
            }
        }.navigationTitle("Second View")
    }
}

