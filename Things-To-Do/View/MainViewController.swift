import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var toDoTable: UITableView!
    private var toDoViewModel: ToDoViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoTable.dataSource = self
        self.toDoTable.delegate = self
        self.toDoViewModel = ToDoViewModel()
        bindVM(with: toDoViewModel)
    }
    
    func bindVM(with viewModel: ToDoViewModel?) {
        
    }

}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vModel = self.toDoViewModel else { return 0}
        return vModel.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


