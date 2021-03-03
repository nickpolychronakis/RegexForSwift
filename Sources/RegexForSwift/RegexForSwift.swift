import Foundation

// MARK: REGEX FUNCTION
// Επιστρέφει τα αποτελέσματα απο την αναζήτηση με regex σε ένα κείμενο.
struct Regex {
    static func results(regExText: String, targetText: String, caseSensitive: Bool, diacriticSensitive: Bool, regexSearch: Bool) -> [NSTextCheckingResult] {
        // Αφαιρώ τα διακριτικά (τόνους) απο το κείμενο.
        let foldedRegexText = diacriticSensitive ? regExText : regExText.folding(options: .diacriticInsensitive, locale: .current)
        // Υπάρχει κίνδυνος να τροποποιεί το μήκος του string χωρίς να το ξέρω, και να δημιουργήσει προβλήματα αργότερα, να το έχω υπ' όψην μου.
        // Αν χρειαστεί να το αφαιρέσω, σε περίπτωση που χρησιμοποιώ το SPM με κάποιο NSPredicate, να αφαιρέσω και απο εκεί το diacritic Insensitive [d]
        guard regExText.utf16.count == foldedRegexText.utf16.count else { fatalError("Πώ ρε φίλε, έπρεπε να είναι ίδια.")}
        let foldedTargetText = diacriticSensitive ? targetText : targetText.folding(options: .diacriticInsensitive, locale: .current)
        // Υπάρχει κίνδυνος να τροποποιεί το μήκος του string χωρίς να το ξέρω, και να δημιουργήσει προβλήματα αργότερα, να το έχω υπ' όψην μου.
        // Αν χρειαστεί να το αφαιρέσω, σε περίπτωση που χρησιμοποιώ το SPM με κάποιο NSPredicate, να αφαιρέσω και απο εκεί το diacritic Insensitive [d]
        guard targetText.utf16.count == foldedTargetText.utf16.count else { fatalError("Πώ ρε φίλε, έπρεπε να είναι ίδια.")}

        // μηδενίζω τα αποτελέσματα
        var results: [NSTextCheckingResult] = []
        // τα options του regular expression
        var regexOptions: NSRegularExpression.Options = []
        // Αν θα αγνοεί τους ειδικούς χαρακτήρες για το REGEX και θα θεωρεί το regExText ως κανονικό String.
        if !regexSearch { regexOptions.insert(.ignoreMetacharacters) }
        // Αν για την αναζήτηση θα υπολογίζονται η διαφορά κεφαλαίων-μικρών ή όχι.
        if !caseSensitive { regexOptions.insert(.caseInsensitive) }
        do {
            // δημιουργία του regex
            let reg = try NSRegularExpression(pattern: foldedRegexText, options: regexOptions)
            // εκτέλεση του regex
            return reg.matches(in: foldedTargetText, options: [], range: NSRange(location: 0, length: targetText.utf16.count))
        } catch {
            // σε περίπτωση σφάλματος μηδενίζω το array
            results = []
        }
        return results
    }
    
}
