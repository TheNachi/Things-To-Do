import Foundation

class ToDoViewModel {
    private var data = MockData.listData()
    
//    init(with toDoLIst: [ToDoListItem]) {
//        self.data = toDoLIst
//    }
}

extension ToDoViewModel: ToDoVMProtocol {
    func getData(index: Int) -> ToDoListItem {
        return self.getAllData()[index]
    }
    
    func getToDoLIstTableCellItem(index: Int) -> ToDoTableViewCellModel {
        return ToDoTableViewCellModel(with: self.getData(index: index))
    }
    
    func getAllData() -> [ToDoListItem] {
        return self.data
    }
    
    func getDataCount() -> Int {
        return self.getAllData().count
    }
}

protocol ToDoVMProtocol {
    func getAllData() -> [ToDoListItem]
    func getDataCount() -> Int
    func getToDoLIstTableCellItem(index: Int) -> ToDoTableViewCellModel
    func getData(index: Int) -> ToDoListItem
}
