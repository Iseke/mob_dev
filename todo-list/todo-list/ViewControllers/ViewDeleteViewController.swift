//
//  ViewViewController.swift
//  todo-list
//
//  Created by Islam Abdukarimov on 18.04.2022.
//

import UIKit
import RealmSwift

class ViewDeleteViewController: UIViewController {
    
    public var item: ToDoListItem?
    public var deletionHandler: (() -> Void)?
    
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    private let realm = try! Realm()
    
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brown
        
        itemLabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from:  item!.date)

        navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }
    
    
    
    @objc private func didTapDelete(){
        guard let myItem = self.item else{
            return
        }
        realm.beginWrite()
        realm.delete(myItem)
        try! realm.commitWrite()
        
        deletionHandler?()
        navigationController?.popToRootViewController(animated: true )
    }
    

}
