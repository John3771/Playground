
/*
 1. Создать тюпл с тремя параметрами:
 - максимальное количество отжиманий
 - максимальное количество подтягиваний
 - максимальное количество приседаний
 Заполните его своими достижениями. Распечатайте его через println()
 */

var myDailyMaximumSportResult = (pushups: 20, pullups: 5, squads: 25)
//let (pushups, pullups, squads) = dailyMaximumSportResult
//print(pushups, dailyMaximumSportResult.1, squads)

print(myDailyMaximumSportResult)
print()

/*
 2. Также сделать 3 отдельных вывода в консоль для каждого параметра
 При том одни значения доставайте по индексу, а другие по параметру
 */

print(myDailyMaximumSportResult.squads)
print(myDailyMaximumSportResult.0)
print(myDailyMaximumSportResult.1)
print()

/*
 3. Создать такой же тюпл для другого человека (супруги или друга) с такими же параметрами,
 но с другими значениями Используйте промежуточную переменную чтобы поменять соответствующие
 значения первого тюпла на значения второго
 */

var friendsDailyMaximumSportResult = (pushups: 100, pullups: 20, squads: 50)

let copyResult = myDailyMaximumSportResult

myDailyMaximumSportResult = friendsDailyMaximumSportResult

print("Значения до копирования - \(copyResult),\nЗначение после копирования - \(myDailyMaximumSportResult)\n")

/*
 4. Создать третий тюпл с теми же параметрами, но значения это разница между
 соответствующими значениями первого и второго тюплов Результат выведите в консоль
 */


let differenceBetweenTwoGuysWithSportResults = (
    differencePushups: friendsDailyMaximumSportResult.pushups - copyResult.pushups,
    diffrencePullups: friendsDailyMaximumSportResult.pullups - copyResult.pullups,
    differenceSquads: friendsDailyMaximumSportResult.2 - copyResult.2
)


print("Мой воображаемый друг отжимается на \(differenceBetweenTwoGuysWithSportResults.0) раз больше.\nНа \(differenceBetweenTwoGuysWithSportResults.1) раз больше подтягивается, и на \(differenceBetweenTwoGuysWithSportResults.2) раз больше приседает.\nЗавидую моему воображаемому другу.")
