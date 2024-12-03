//
//  RedNosedReports.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/2/24.
//

import Parsing
import Tagged

enum LevelTag {}
typealias Level = Tagged<LevelTag, Int>

enum ReportTag {}
typealias Report = Tagged<ReportTag, [Level]>

enum RedNosedReports {
    struct ListParser: Parser {
        var body: some Parser<Substring, [Report]> {
            Many {
                Many {
                    Int.parser().map { Level.init($0) }
                } separator: {
                    Whitespace(.horizontal)
                }
                .map { Report.init($0) }
            } separator: {
                Whitespace(1, .vertical)
            }
        }
    }

    enum Direction {
        case increasing, decreasing

        init?(left: Level, right: Level) {
            if right > left {
                self = .increasing
            } else if left > right {
                self = .decreasing
            } else {
                return nil
            }
        }
    }

    enum Safety: Equatable {
        case safe
        case unsafe(Int)
    }

    static func safety(of report: Report) -> Safety {
        var direction: Direction?

        for idx in report.indices {
            guard let left = report[safe: idx],
                  let right = report[safe: idx + 1] else {
                continue
            }

            let distance = abs(left - right)

            guard distance >= 1 && distance <= 3 else { return .unsafe(idx) }

            let curDirection = Direction(left: left, right: right)
            if let direction {
                guard curDirection == direction
                else { return .unsafe(idx) }

            } else {
                direction = curDirection
            }
        }

        return .safe
    }

    static func checkSafety(of report: Report, dampeningIndex: Int) -> Safety? {
        if report.indices.contains(dampeningIndex) {
            var report = report
            report.rawValue.remove(at: dampeningIndex)

            return safety(of: report)

        } else {
            return nil
        }
    }


    static func countSafeReports(from input: String) throws -> Int {
        let reports = try ListParser().parse(input)
        return reports.filter(\.hasElements).count(where: {
            safety(of: $0) == .safe
        })
    }



    static func countSafeReportsWithProblemDampener(from input: String) throws -> Int {
        let reports = try ListParser().parse(input).filter(\.hasElements)

        return reports.count(where:  {
            switch safety(of: $0) {
            case .safe:
                return true
            case .unsafe(let index):
                if checkSafety(of: $0, dampeningIndex: index) == .safe {
                    return true
                }

                if checkSafety(of: $0, dampeningIndex: index - 1) == .safe {
                    return true
                }

                if checkSafety(of: $0, dampeningIndex: index + 1) == .safe {
                    return true
                }

                return false
            }
        })
    }
}
