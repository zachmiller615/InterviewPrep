//
// Created by Zach Miller on 17/01/2020.
//

public struct CommandLineTool {
    // Initializer
    public init() {}

    // Methods
    public func run() {
        let dynamicProgramming = DynamicProgramming()
        let numberOfRows = 17
        let numberOfColumns = 9
        let offLimitCells: Set<GridPoint> =
                [GridPoint(row: 0, column: 7),
                 GridPoint(row: 0, column: 8),
                 GridPoint(row: 1, column: 8),
                 GridPoint(row: 2, column: 8),
                 GridPoint(row: 3, column: 8),
                 GridPoint(row: 4, column: 8),
                 GridPoint(row: 5, column: 8),
                 GridPoint(row: 6, column: 8),
                 GridPoint(row: 7, column: 8),
                 GridPoint(row: 8, column: 8),
                 GridPoint(row: 9, column: 7),
                 GridPoint(row: 9, column: 8)]
        print("-----")
        let result = dynamicProgramming.robotInAGrid(numberOfRows: numberOfRows, numberOfColumns: numberOfColumns, offLimitCells: offLimitCells)
        print("-----")
        print("Result: \(String(describing: result))")
        print("-----")
    }
}