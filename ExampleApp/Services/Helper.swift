//
//  Helper.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import Foundation

class Helper {
	private var numbers: [Int] = []

	func addNumber(_ number: Int) {
		numbers.append(number)
	}
	
	func getNumbers() -> [Int] {
		numbers
	}
    
    func getRandomNumber() -> Int {
        numbers.randomElement() ?? 0
    }
}
