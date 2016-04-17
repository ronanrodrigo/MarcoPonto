//
//  ListEntriesUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListEntriesUsecaseFactory {
    static func make(presenter presenter: ListEntriesPresenter) -> ListEntriesUsecase {
        let gateway = EntryGatewayCoreData()
        return ListEntriesUsecase(gateway: gateway, presenter: presenter)
    }
}
