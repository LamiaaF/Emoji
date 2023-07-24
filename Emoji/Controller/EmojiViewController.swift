import UIKit

class EmojiViewController: UIViewController {
    var apiResult = [EmojiType]()
      var emojiTypeViewModels = [EmojiTypeViewModel]() //
    weak var delegate: EmojiDetailsViewControllerDelegate?


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
//   9 var data: [EmojiType] = [
//        EmojiType(title: "Glasses", subTitle: "smug face with glasses", imageName: "Glasses", isFavorite: false),
//        EmojiType(title: "Happy", subTitle: "Happy face", imageName: "Happy", isFavorite: false),
//        EmojiType(title: "Thinking", subTitle: "Thinking face", imageName: "Thinking", isFavorite: false),
//        EmojiType(title: "Laughing", subTitle: "laughing face", imageName: "Laughing", isFavorite: false),
//        EmojiType(title: "Fire", subTitle: "Fire emoji", imageName: "Fire", isFavorite: false),
//        EmojiType(title: "Hundred", subTitle: "One hundred", imageName: "Hundred", isFavorite: false),
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        APIHandler.sharedInstance.fetchingDataApi{
            apiData in
            self.apiResult = apiData
            self.emojiTypeViewModels = apiData.map { EmojiTypeViewModel(model: $0) }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        setupTable()
    }
    
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EmojiTableViewCell", bundle: nil), forCellReuseIdentifier: "test")
    }
}

extension EmojiViewController : UITableViewDelegate{
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let newVC = EmojiDetailsViewController()
            newVC.delegate = self // Set the delegate to self
            let selectedEmojiType = emojiTypeViewModels[indexPath.row]
            newVC.emojiTypeViewModels = selectedEmojiType
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }



extension EmojiViewController : UITableViewDataSource {
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emojiTypeViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emojiType = emojiTypeViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! EmojiTableViewCell
  cell.conf(emoji: emojiType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the title for each section
        
        
        return "Emoji"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // Return the title for each section
        return "End"
    }
    
}

    
    // ...  code ...
//
extension EmojiViewController: EmojiDetailsViewControllerDelegate {
    func didAddFavorite(emojiTypeViewModel: EmojiTypeViewModel) {
        if let index = emojiTypeViewModels.firstIndex(where: { $0.title == emojiTypeViewModel.title }) {
            emojiTypeViewModels[index].isFavorite.toggle()
            tableView.reloadData()
        }
    }}
