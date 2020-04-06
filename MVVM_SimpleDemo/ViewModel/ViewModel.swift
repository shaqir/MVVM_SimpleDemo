//
//  ViewModel.swift
//  MVVM_SimpleDemo
//
//  Created by Sakir Saiyed on 07/04/20.
//  Copyright © 2020 Sakir Saiyed. All rights reserved.
//

import Foundation

class ViewModel {
    private var myModel = Model<Observable<Date>>()
    
    func addEntry() {
        let dateObservable = Observable(Date())
        myModel.insert(dateObservable)
        
        dateObservable.bind = { _ in
            NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "updateUI")))
        }
        
        //One-way binding : ViewModel to View
        //Every 5 seconds date will update
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            dateObservable.value = Date()
        }
    }
    
    var count: Int {
        return myModel.count
    }
    
    func removeEntry(at index: Int) {
        myModel.remove(at: index)
    }
    
    subscript(index: Int) -> String? {
        guard let date = myModel[index] else {
            return nil
        }
        return date.value.description
    }
}

