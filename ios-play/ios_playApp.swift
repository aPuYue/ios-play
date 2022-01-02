//
//  ios_playApp.swift
//  ios-play
//
//  Created by user on 2022/01/02.
//

import SwiftUI
import AmplifyPlugins
import Amplify

@main
struct ios_playApp: App {
    
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            
            try Amplify.configure()
            
            print("configure Success")
        } catch {
            print("configure Error")
        }
    }
}
