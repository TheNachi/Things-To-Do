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
            try! realm.commitWrite()
            
            completionHandler?()
        } else {
            
        }
    }
    
}


extension CreateToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
