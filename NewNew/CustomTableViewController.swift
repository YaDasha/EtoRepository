//
//  newViewController3.swift
//  NewNew
//
//  Created by Дарья Ксензова on 27.04.2024.
//

import UIKit
import SnapKit
import Moya

class CustomTableViewController: UIViewController {
    
    let idCell = "Main Cell"
    
    private var data: [Int] = [1]
    
    let buttonClose: UIButton = {
        let butttonClose = UIButton()
        butttonClose.backgroundColor = .systemPink
        butttonClose.setTitle("Close", for: .normal)
        butttonClose.setTitleColor(.black, for: .normal)
        return butttonClose
    }()
    
    let tableView: UITableView = UITableView()
    
    let cellHeight: CGFloat = 70
    let spacingHeight: CGFloat = 10
    
    var books: [Book] = []
    
    let provider = MoyaProvider<BooksAPI>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom Cell")
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(buttonClose)
        
        print("!!! 1: \(books)")
        
        buttonClose.addAction(UIAction(handler: closeThisView(_:)), for: .touchUpInside)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.sectionHeaderHeight = 10
        
        settingConstraint()
        
        getBooks()
    }

    func closeThisView(_: UIAction) {
        dismiss(animated: true, completion: nil)
        
        print("Pik Pik")
    }
    
    func settingConstraint() {
        buttonClose.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(80)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(buttonClose.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func getBooks() {
        provider.request(.getBooks) { result in
            switch result {
            case let .success(response):
                do {
                    let booksResult = try JSONDecoder().decode([Book].self, from: response.data)
                    self.books = booksResult
                    self.tableView.reloadData()
                    print(booksResult)
                } catch {
                    print("Ошибка при разборе ответа: \(error)")
                }
            case let .failure(error):
                print("Ошибка запроса: \(error)")
            }
        }
    }
}

struct Book: Decodable {
    let book: String
    let title: String?
    let author: String?
    let condition: String
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        let book = books[indexPath.section]

        let model = CustomCellModel(
            backgroundImageBP: .lisa4,
            book: book.book,
            title: book.title ?? "",
            subtitle: book.author ?? "",
            condition: book.condition,
            backgroundColor: .systemYellow
        )
        
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    
}

// Зарегистрировать аккаунт на github, создать репозиторий, создать ssh ключ, подключить его к ноутбуку
// при нажатии на ячейку она расширяется в два раза и в расширенной ячейке показывается что-то еще
