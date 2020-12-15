import UIKit

class DisplayToDoViewController: UIViewController {
    @IBOutlet weak var toDoTitleLabel: UILabel!
    @IBOutlet weak var toDoDate: UILabel!
    @IBOutlet weak var toDoDetail: UILabel!
    
    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoDetail.text = item?.toDoContent
        self.toDoTitleLabel.text = item?.toDoTitle
        self.toDoDate.text = DisplayToDoViewController.dateFormatter.string(from: item!.toDoDate)
    }
    
    @IBAction func closeeDisplayPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
