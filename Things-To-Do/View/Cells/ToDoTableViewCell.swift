import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toDoTitle: UILabel!
    
    var toDoItem: ToDoListItem?
    weak var delegate: CellDelegate?
    var toDoIndex: Int?
    
    func bindVM(with viewModel: ToDoTableViewCellModel) {
        self.toDoTitle.text = viewModel.toDoTitle
        self.toDoItem = viewModel.toDoItem
        self.toDoIndex = viewModel.toDoIndex
    }

    @IBAction func deletePressed(_ sender: UIButton) {
        guard let toDoItem = toDoItem, let toDoIndex = toDoIndex else {
            return
        }
        delegate?.didTapDelete(with: toDoItem, index: toDoIndex)
        
    }
}


class ToDoTableViewCellModel {
    var toDoTitle: String = ""
    var toDoItem: ToDoListItem?
    var toDoIndex: Int?
    
    init(with toDoList: ToDoListItem, index: Int) {
        self.toDoTitle = toDoList.toDoTitle
        self.toDoItem = toDoList
        self.toDoIndex = index
    }
    
}


protocol CellDelegate: class {
    func didTapDelete(with item: ToDoListItem, index: Int)
}
