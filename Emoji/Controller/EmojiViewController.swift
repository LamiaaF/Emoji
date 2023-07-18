import UIKit

class EmojiViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [EmojiType] = [
        EmojiType(title: "Glasses", subTitle: "smug face with glasses", imageName: "Glasses", isFavorite: false),
        EmojiType(title: "Happy", subTitle: "Happy face", imageName: "Happy", isFavorite: false),
        EmojiType(title: "Thinking", subTitle: "Thinking face", imageName: "Thinking", isFavorite: false),
        EmojiType(title: "Laughing", subTitle: "laughing face", imageName: "Laughing", isFavorite: false),
        EmojiType(title: "Fire", subTitle: "Fire emoji", imageName: "Fire", isFavorite: false),
        EmojiType(title: "Hundred", subTitle: "One hundred", imageName: "Hundred", isFavorite: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        newVC.indexPath = indexPath
        newVC.delegate = self

        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
}

extension EmojiViewController : UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emojiType = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! EmojiTableViewCell
        cell.config(emoji: emojiType)
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

    
    
extension EmojiViewController : EmojiDetailsViewControllerDelegate {
    
    func didAddFavorite(id: IndexPath) {
        data[id.row].isFavorite.toggle()
        tableView.reloadData()
    }
    
}

