//
//  ContentView.swift
//  NavigationStack
//
//  Created by Muhammad Athif on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var path: [Int] = []
    @State var count: Int = 0
    @State var isSecondView = false
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            NavigationStack (path: $router.path){
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    
                    // Solution 1 for NavigationLink with action button
                    Button{
                        count += 1
                        isSecondView = true
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue)
                                .frame(width: 200, height: 50)
                            Text("Go To Second View")
                                .foregroundColor(.white)
                        }
                    }
                    .navigationDestination(isPresented: $isSecondView){
                        SecondView()
                    }
                    
                    
                    // Solution 1 for NavigationLink with action button
                    Button(action: {
                        // Button action goes here
                       
                    }) {
                        NavigationLink(destination:SecondView()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.indigo)
                                    .frame(height: 50)
                                Text("Go to second view using simultaneous gesture")
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        // Button action can also go here
                        count += 1
                    })
                    
                    // Solution 1 for Multi level NavigationStack
                    NavigationLink(value: "view 1"){
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green)
                                .frame(width: 200, height: 50)
                            Text("Go To Second View")
                                .foregroundColor(.white)
                        }
                    }
                    .navigationDestination(for: String.self){ _ in
                        SecondView().environmentObject(router)
                    }
                   
                    // Solution 2 for Multi-Level NavigationStack
                    Button(action: {
                        router.path.append(count+1)
                    }) {
                        Text("Go to second view")
                    }
                    .navigationDestination(for: Int.self){ destination in
                        switch destination {
                        case 1:
                            SecondView().environmentObject(router)
                        case 2:
                            ThirdView().environmentObject(router)
                        default:
                            EmptyView()
                        }
                    }
                   
                }
            }
            .padding()
        }
        VStack{
            Text("Path")
            Text("Number of var count: \(count)")
            // Uncomment the variable bindings in each view to see the variable path changes
            Text("Number of detail views on the stack: \(path.count)")
            Text("Stack from router: \(router.path.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
