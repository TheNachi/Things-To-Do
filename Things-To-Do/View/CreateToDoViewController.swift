import UIKit
import RealmSwift

class CreateToDoViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.becomeFirstResponder()
        titleTextField.delegate = self
        detailTextField.delegate = self
        datePicker.setDate(Date(), animated: true)
    }
    
    @IBAction func createPressed(_ sender: UIButton) {
        if let titleText = titleTextField.text, let detailText = detailTextField.text, !titleText.isEmpty, !detailText.isEmpty {
            let date = datePicker.date
            
            realm.beginWrite()
            let newItem = ToDoListItem()
            newItem.toDoDate = date
            newItem.toDoContent = detailText
            newItem.toDoTitle = titleText
            realm.create(ToDoListItem.self, value: newItem)
//            realm.create(newItem)
            try! realm.commitWrite()
            
            completionHandler?()
            self.dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
    
}


extension CreateToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
