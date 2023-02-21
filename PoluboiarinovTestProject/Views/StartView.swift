//
//  StartView.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @State var user = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("User", text: $user)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 240)
                Spacer().frame(height: 30)
                NavigationLink("Get gists!") { MainView() }
                    .buttonStyle(.bordered)
            }
            .onDisappear {
                vm.owner = user
                print(vm.owner == "" ? "no user was added" : "\(vm.owner) was added as user")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
