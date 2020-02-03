//
// Created by Zach Miller on 28/01/2020.
//

struct DynamicProgramming {
    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time.
    /// Implement a method to count how many possible ways the child can run up the stairs.
    func tripleStep(numberOfSteps: Int) -> Int? {
        var nMinus3 = 1
        var nMinus2 = 2
        var nMinus1 = 4

        if (numberOfSteps < 1) {
            return nil
        } else if (numberOfSteps == 1) {
            return nMinus3
        } else if (numberOfSteps == 2) {
            return nMinus2
        } else if (numberOfSteps == 3) {
            return nMinus1
        }

        var index = 4
        while (index < numberOfSteps) {
            let intermediateResult = (nMinus3 + nMinus2 + nMinus1)
            nMinus3 = nMinus2
            nMinus2 = nMinus1
            nMinus1 = intermediateResult
            index += 1
        }
        return (nMinus3 + nMinus2 + nMinus1)
    }

    /// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
    /// Imagine a robot sitting on the upper left corner of a grid with r rows and c columns.
    /// The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them.
    /// Design an algorithm to find a path for the robot from the top left to the bottom right.
    func robotInAGrid(numberOfRows: Int, numberOfColumns: Int, offLimitCells: Set<GridPoint>) -> GridPath? {
        let topLeft = GridPoint(row: 0, column: 0)
        var failedCells = offLimitCells
        return self.robotInAGrid(currentPoint: topLeft, currentPath: [], numberOfRows: numberOfRows, numberOfColumns: numberOfColumns, failedCells: &failedCells)
    }
}

// Private Methods
private extension DynamicProgramming {
    func robotInAGrid(currentPoint: GridPoint, currentPath: GridPath, numberOfRows: Int, numberOfColumns: Int, failedCells: inout Set<GridPoint>) -> GridPath? {
        guard ((currentPoint.row < numberOfRows) && (currentPoint.column < numberOfColumns) && !failedCells.contains(currentPoint)) else {
            return nil
        }
        let newPath = currentPath + [currentPoint]
        let targetPoint = GridPoint(row: (numberOfRows - 1), column: (numberOfColumns - 1))
        if (currentPoint == targetPoint) {
            return newPath
        }
        let cellToTheRight = GridPoint(row: currentPoint.row, column: (currentPoint.column + 1))
        if let pathGoingRight = self.robotInAGrid(currentPoint: cellToTheRight, currentPath: newPath, numberOfRows: numberOfRows, numberOfColumns: numberOfColumns, failedCells: &failedCells) {
            return pathGoingRight
        }
        let cellBelow = GridPoint(row: (currentPoint.row + 1), column: currentPoint.column)
        if let pathGoingDown = self.robotInAGrid(currentPoint: cellBelow, currentPath: newPath, numberOfRows: numberOfRows, numberOfColumns: numberOfColumns, failedCells: &failedCells) {
            return pathGoingDown
        }
        failedCells.insert(currentPoint) // Dynamic programming - don't repeat stuff we've already done
        return nil
    }
}