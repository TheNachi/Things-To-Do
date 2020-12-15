import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var toDoTitle: UILabel!
    
    func bindVM(with viewModel: ToDoTableViewCellModel) {
        self.toDoTitle.text = viewModel.toDoTitle
    }

}


class ToDoTableViewCellModel {
    var toDoTitle: String = ""
    
    init(with toDoList: ToDoListItem) {
        self.toDoTitle = toDoList.toDoTitle
    }
    
}
