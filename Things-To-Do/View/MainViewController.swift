import UIKit
import RealmSwift

class MainViewController: UIViewController {
    @IBOutlet weak var toDoTable: UITableView!
    private var toDoViewModel: ToDoViewModel?
    private var data = [ToDoListItem]()
    
    private let realm = try! Realm()
    var currentToDo: ToDoListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoTable.dataSource = self
        self.toDoTable.delegate = self
        toDoTable.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        data = realm.objects(ToDoListItem.self).map({ $0 })
        self.toDoViewModel = ToDoViewModel(with: data)
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
        
        if let displayVC = segue.destination as? DisplayToDoViewController {
            displayVC.item = self.currentToDo
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
        cell.delegate = self
        cell.bindVM(with: vModel.getToDoLIstTableCellItem(index: indexPath.row))
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vModel = self.toDoViewModel else { return }
        currentToDo = vModel.getData(index: indexPath.row)
        self.performSegue(withIdentifier: "goToDisplayVC", sender: self)
    }
    
}

extension MainViewController: CellDelegate {
    func didTapDelete(with item: ToDoListItem, index: Int) {
        guard  let vModel = toDoViewModel else {
            return
        }
        realm.beginWrite()
        realm.delete(item)
        vModel.deleteItemAtIndex(index: index)
        self.refresh()
        try! realm.commitWrite()
        
    }
}
