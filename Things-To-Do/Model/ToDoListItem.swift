import RealmSwift

class ToDoListItem: Object {
    @objc dynamic var toDoTitle: String = ""
    @objc dynamic var toDoContent: String = ""
    @objc dynamic var toDoDate: Date = Date()
}


struct MockData {
    static func listData() -> [ToDoListItem] {
        let userOne = ToDoListItem()
        let userTwo = ToDoListItem()
        
        userOne.toDoContent = "this is the one"
        userOne.toDoTitle = "one"
        userOne.toDoDate = Date()
        
        userTwo.toDoContent = "this is the two"
        userTwo.toDoTitle = "two"
        userTwo.toDoDate = Date()
        
        return [userOne, userTwo]
    }
}
