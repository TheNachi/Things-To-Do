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
            let toDoItem = ToDoListItem()
            toDoItem.toDoDate = date
            toDoItem.toDoContent = detailText
            toDoItem.toDoTitle = titleText
            realm.create(ToDoListItem.self, value: toDoItem)
            try! realm.commitWrite()
            
            completionHandler?()
            self.dismiss(animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Please ensure that you've left no field blank, Thanks", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}


extension CreateToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
