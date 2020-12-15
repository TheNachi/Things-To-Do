import Foundation

class ToDoViewModel {
    private var data: [ToDoListItem] = []
    
    init(with toDoLIst: [ToDoListItem]) {
        self.data = toDoLIst
    }
}

extension ToDoViewModel: ToDoVMProtocol {
    func getData(index: Int) -> ToDoListItem {
        return self.getAllData()[index]
    }
    
    func getToDoLIstTableCellItem(index: Int) -> ToDoTableViewCellModel {
        return ToDoTableViewCellModel(with: self.getData(index: index), index: index)
    }
    
    func getAllData() -> [ToDoListItem] {
        return self.data
    }
    
    func getDataCount() -> Int {
        return self.getAllData().count
    }
    
    func deleteItemAtIndex(index: Int) {
        data.remove(at: index)
    }
}

protocol ToDoVMProtocol {
    func getAllData() -> [ToDoListItem]
    func getDataCount() -> Int
    func getToDoLIstTableCellItem(index: Int) -> ToDoTableViewCellModel
    func getData(index: Int) -> ToDoListItem
    func deleteItemAtIndex(index: Int)
}
