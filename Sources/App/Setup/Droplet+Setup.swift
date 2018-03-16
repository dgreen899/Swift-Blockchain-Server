@_exported import Vapor

extension Droplet {
    public func setup() throws {
        // Do any additional droplet setup
        
        setupControllers()
    }
    
    
    func setupControllers() {
        _ = BlockchainController(drop: self)
    }
}
