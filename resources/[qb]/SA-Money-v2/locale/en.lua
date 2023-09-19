local Translations = {
    notifications = {
        enoughmoney = "You don't have enough money.",
        FullInventory = "Your inventory is full, your money has been deposited into the bank.",
        recieved = "You recieved ",
        currency = "$",
        paid = "You've paid "
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
