//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by John Kouris on 9/5/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = person.gender
        birthYearLabel.text = person.birthYear
    }

}
