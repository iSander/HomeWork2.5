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
    
    var answers: [Answer]!
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        calculateFrequentlyOccurringElement()
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
        
        let maxResult = dictionary.max { $0.value > $1.value }
        guard let resultAnimal = maxResult?.key else { return }
        
        updateLabels(withAnimal: resultAnimal)
    }
    
    private func updateLabels(withAnimal: AnimalType) {
        animalLabel.text = "Вы - \(withAnimal.rawValue)!"
        textLabel.text = withAnimal.difinition
    }
}
