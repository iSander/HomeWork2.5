//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Properties
    
    var answers: [Answer] = []
    
    private var resultAnimal: AnimalType?
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        calculateFrequentlyOccurringElement()
        updateLabels()
    }
    
    deinit {
        print("ResultsViewController was been dealocated")
    }
    
    // MARK: - Private Methods
    
    private func calculateFrequentlyOccurringElement() {
        var dictionary = [AnimalType: Int]()
        for item in answers {
            dictionary[item.type] = (dictionary[item.type] ?? 0) + 1
        }
        
        let maxResult = dictionary.max { a, b in a.value < b.value }
        resultAnimal = maxResult?.key
    }
    
    private func updateLabels() {
        guard let resultAnimal = resultAnimal else { return }

        animalLabel.text = "Вы - \(String(resultAnimal.rawValue))!"
        textLabel.text = resultAnimal.difinition
    }
}
