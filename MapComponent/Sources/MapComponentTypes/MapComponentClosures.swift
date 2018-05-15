//
//  MapComponentClosures.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public typealias MapIdentifier = String
public typealias MapEventClosure = (MapIdentifier) -> Void // String refers to the id of the datasource
