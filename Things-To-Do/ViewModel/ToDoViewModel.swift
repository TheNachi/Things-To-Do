import Foundation

class ToDoViewModel {
    private var data = [ToDoListItem]()
}

extension ToDoViewModel: ToDoVMProtocol {
    func getData() -> [ToDoListItem] {
        return self.data
    }
    
    func getDataCount() -> Int {
        return self.getData().count
    }
}

protocol ToDoVMProtocol {
    func getData() -> [ToDoListItem]
    func getDataCount() -> Int
}
