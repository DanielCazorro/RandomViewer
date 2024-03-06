//
//  MainViewModel.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 31/1/24.
//

import Foundation

class MainViewModel {
    private let dataManager: MainViewDataManager
    private var users: [User] = []

    init(dataManager: MainViewDataManager) {
        self.dataManager = dataManager
        self.users = dataManager.users
    }

    // CollectionView Users information
    func numberOfUsers() -> Int {
        return users.count
    }

    func userName(at index: Int) -> String {
        guard index < users.count else { return "" }
        return users[index].name
    }

    func userAge(at index: Int) -> Int {
        guard index < users.count else { return 0 }
        return users[index].age
    }

    func userSex(at index: Int) -> String {
        guard index < users.count else { return "" }
        return users[index].sex
    }

    func userHobbies(at index: Int) -> [String] {
        guard index < users.count else { return [] }
        return users[index].hobbies
    }

    func userDescription(at index: Int) -> String {
        guard index < users.count else { return "" }
        return users[index].description
    }

    // Método para generar texto aleatorio
    func generateRandomText(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
