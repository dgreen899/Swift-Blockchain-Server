//
//  BlockchainController.swift
//  Blockchain-Server
//
//  Created by Dameon Green on 1/23/18.
//

import Foundation
import Vapor
import HTTP

class BlockchainController {
    
    private (set) var drop: Droplet
    private (set) var blockchainService: BlockchainService
    
    init(drop: Droplet) {
        self.drop = drop
        self.blockchainService = BlockchainService()
        setupRoutes()
    }
    
    private func setupRoutes() {
        
        self.drop.post("mine") { request  in
            
            if let transaction = Transaction(request: request) {
               
                let block = self.blockchainService.getMinedBlock(transactions:[transaction])
                block.addTransaction(transaction:transaction)
                return try JSONEncoder().encode(block)
            }
            return try JSONEncoder().encode(["message: something bad happened!"])
        }
        self.drop.get("blockchain") { request in
            
            let blockchain = self.blockchainService.getBlockchain()
           return try! JSONEncoder().encode(blockchain)
            
        }
    }
    
}
