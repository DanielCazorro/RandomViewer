//
//  MainViewModel.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 31/1/24.
//

import Foundation

class MainViewModel {
    
    // Método para generar texto aleatorio
    func generateRandomText(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
