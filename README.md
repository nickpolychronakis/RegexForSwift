# RegexForSwift

Συναρτήσεις που κάνουν την χρήση Regex πιο εύκολη σε Swift.

Δημιουργείται έτσι:

``` swift
let results = Regex.results(regExText: "Hello", targetText: "Hello, world!", caseSensitive: false, diacriticSensitive: false, regexSearch: true)
```

| Attributes  |  Τι κάνει |
|:----------|:----------|
| regExText | Το κείμενο του Regex |
| targetText | Το κείμενο που θα γίνει η αναζήτηση |
| caseSensitive | Αν η αναζήτηση θα λαμβάνει υπ' όψη την διαφορά κεφαλαίων-μικρών χαρακτήρων. | 
| diacriticSensitive | Αν η αναζήτηση θα λαμβάνει υπ' όψη την διαφορά τονισμένων χαρακτήρων. |
| regexSearch | Αν θα υπολογίζει το regExText ως Regex ή ως απλό String  |
| results | Τα αποτελέσματα που επιστρέφει είναι του τύπου [NSTextCheckingResult]. Για παράδειγμα το results[0].range επιστρέφει το NSRange που είναι η πρώτη εύρεση της αναζήτησης |
