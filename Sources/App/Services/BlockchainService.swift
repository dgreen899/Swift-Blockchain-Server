//
//  BlockchainService.swift
//  Blockchain-Server
//
//  Created by Dameon Green on 1/23/18.
//

import Foundation

class BlockchainService {
    
    private (set) var blockchain: Blockchain!
    
    init() {
        self.blockchain = Blockchain(genesisBlock: Block())
    }
    
    func getBlockchain() -> Blockchain {
    return self.blockchain
    }
    
    func getMinedBlock(transactions:[Transaction]) -> Block {
    
    return self.blockchain.getNextBlock(transactions:transactions)
        
    }
}
