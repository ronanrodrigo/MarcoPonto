//
//  SaveEntryUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class SaveEntryUsecaseFactory {
    static func make(presenter presenter: SaveEntryPresenter) -> SaveEntryUsecase {
        return SaveEntryUsecase(gateway: EntryGatewayCoreDataFactory.make(), presenter: presenter)
    }
}
