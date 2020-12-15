import UIKit

class DisplayToDoViewController: UIViewController {
    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
