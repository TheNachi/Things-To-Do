import RealmSwift

class ToDoListItem: Object {
    @objc dynamic var toDoTitle: String = ""
    @objc dynamic var toDoContent: String = ""
    @objc dynamic var toDoDate: Date = Date()
}
