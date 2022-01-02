//
//  ContentView.swift
//  ios-play
//
//  Created by user on 2022/01/02.
//

import SwiftUI
import Amplify

struct ContentView: View {
    
    @State var fileStatus: String?
    
    var body: some View {
        if let fileStatus = fileStatus {
            Text(fileStatus)
        }
        Button("Upload File", action: uploadFile).padding()
    }
    
    func uploadFile() {
        let fileKey = "testFile.text"
        let fileContents = "测试文字123"
        let fileData = fileContents.data(using: .utf8)!
        
        Amplify.Storage.uploadData(
            key: fileKey,
            data: fileData
        ) { result in
            switch result {
            case .success(let key):
                print("upload succeed key: ", key)
                
                DispatchQueue.main.async {
                    fileStatus = "Uploaded"
                }
            case .failure(let err):
                print("upload failure, error: ", err)
                
                DispatchQueue.main.async {
                    fileStatus = "Failed to Upload"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
