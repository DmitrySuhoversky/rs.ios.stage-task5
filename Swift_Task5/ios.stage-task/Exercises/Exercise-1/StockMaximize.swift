import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {

        guard prices.count > 1 else {
            return 0
        }

        var maxProfit = 0
        var MutablePrices = prices
        
        while (MutablePrices.count>1) {
            for _ in 0...MutablePrices.firstIndex(of: MutablePrices.max()!)! {
                maxProfit += (MutablePrices.max()! - MutablePrices[0])
                MutablePrices.remove(at: 0)
            }
        }
    return maxProfit
    }
}
