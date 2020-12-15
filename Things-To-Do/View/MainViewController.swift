import UIKit
import RealmSwift

class MainViewController: UIViewController {
    @IBOutlet weak var toDoTable: UITableView!
    private var toDoViewModel: ToDoViewModel?
    private var data = [ToDoListItem]()
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoTable.dataSource = self
        self.toDoTable.delegate = self
        data = realm.objects(ToDoListItem.self).map({ $0 })
        self.toDoViewModel = ToDoViewModel()
        bindVM(with: toDoViewModel)
    }
    
    func bindVM(with viewModel: ToDoViewModel?) {
        self.toDoTable.reloadData()
    }
    
    @IBAction func createPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCreateToDoVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateToDoViewController {
            createVC.completionHandler = { [weak self] in
                self?.refresh()
            }
        }
    }
    
    func refresh() {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        toDoTable.reloadData()
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vModel = self.toDoViewModel else { return 0}
        return vModel.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vModel = self.toDoViewModel, let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() }
        cell.bindVM(with: vModel.getToDoLIstTableCellItem(index: indexPath.row))
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


