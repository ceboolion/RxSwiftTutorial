import Foundation

typealias BlockWithSource = (Source)->Void
typealias VoidBlock = ()->Void

class SpyListPresenter {
    var data = [SpyDTO]()
    fileprivate var modelLayer: ModelLayer!
    
    init(modelLayer: ModelLayer) {
        self.modelLayer = modelLayer
    }
}

//MARK: - Data Methods
extension SpyListPresenter {
    
    func loadData(finished: @escaping BlockWithSource) {
        modelLayer.loadData { [weak self] source, spies in
            self?.data = spies
            finished(source)
        }
    }
}




