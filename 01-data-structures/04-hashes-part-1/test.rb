require_relative 'hashclass'

lotr_runtimes = HashClass.new(6)
lotr_runtimes["The Lord of the Rings: The Fellowship of the Ring"] = "3 hours, 48 minutes";
lotr_runtimes["The Lord of the Rings: The Two Towers"] = "3 hours, 55 minutes";
lotr_runtimes["The Lord of the Rings: The Return of the King"] = "3 hours, 21 minutes";
lotr_runtimes["The Hobbit: An Unexpected Journey"] = "3 hours, 2 minutes";
lotr_runtimes["The Hobbit: The Desolation of Smaug"] = "3 hours, 7 minutes";
lotr_runtimes["The Hobbit: The Battle of Five Armies"] = "2 hours, 44 minutes";

lotr_runtimes.print
