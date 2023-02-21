//
//  GistView.swift
//  PoluboiarinovTestProject
//
//  Created by Sergei Poluboiarinov on 22.02.2023.
//

import SwiftUI

struct GistView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    let gist: Gist
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: gist.owner!.avatarURL!)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 120, maxHeight: 120)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 10, x: 6, y: 3)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 120, maxHeight: 120)
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 10, x: 6, y: 3)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 120, maxHeight: 120)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 10, x: 6, y: 3)
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 120, maxHeight: 120)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 10, x: 6, y: 3)
                }
            }
            Spacer().frame(height: 30)
            Text(gist.owner!.login!)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
            Spacer().frame(height: 20)
            Text(gist.description ?? "There is no description from \(gist.owner!.login!)")
                .font(.title2)
            Spacer().frame(height: 20)
            Text(gist.comments == 1 ? "\(gist.comments!) comment" : "\(gist.comments!) comments")
                .font(.title3)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}
