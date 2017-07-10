//
//  AddActivityDelegate.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/05.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation

protocol AddActivityDelegate {
    func didAddActivity(activity: ActivityDto)
    func defaultName() -> String?
}
