//
//  MainView.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @State private var page = 1
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.gists, id: \.self) { gist in
                    NavigationLink {
                        GistView(gist: gist)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                
                                AsyncImage(url: URL(string: gist.owner!.avatarURL!)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 40, maxHeight: 40)
                                                .cornerRadius(12)
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 40, maxHeight: 40)
                                            .cornerRadius(12)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 40, maxHeight: 40)
                                                .cornerRadius(12)
                                    @unknown default:
                                        Image(systemName: "photo")
                                            .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 40, maxHeight: 40)
                                                .cornerRadius(12)
                                    }
                                }
                                Text(gist.owner!.login!)
                                    .font(.title2)
                                    .lineLimit(1)
                                Spacer()
                            }
                            Text(gist.description ?? "Without description")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if vm.isFiltered == false && vm.gists.count != 0 && vm.gists.count <= 3000 {
                    Button("Add more gists") {
                        vm.loadGists(owner: vm.owner, page: page)
                        page += 1
                    }
                }
            }
        }
        .onAppear {
            vm.loadGists(owner: "", page: page)
            page += 1
        }
        .toolbar {
            ToolbarItem {
                Button(vm.isFiltered ? "Remove filter" : "Filter") {
                    vm.gists.removeAll()
                    page = 1
                    vm.isFiltered.toggle()
                    vm.loadGists(owner: vm.owner, page: page)
                    page += 1
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

