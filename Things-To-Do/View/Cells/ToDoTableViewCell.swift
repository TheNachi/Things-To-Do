//
//  ToDoTableViewCell.swift
//  Things-To-Do
//
//  Created by Munachimso Ugorji on 15/12/2020.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var toDoTitle: UILabel!
    
    func bindVM(with viewModel: ToDoTableViewCellModel) {
        
    }

}


class ToDoTableViewCellModel {
    var toDoTitle: String = ""
    
    init(with toDoList: ToDoListItem) {
        self.toDoTitle = toDoList.toDoTitle
    }
    
}
