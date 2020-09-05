/*
Paranoia

ByteCorp is a famous technological company in Byteania.
The CEO of ByteCorp doesn't trust anyone and thinks that his accountant managed to move huge amounts of money to a competitor company, MegaCorp.
He hires a computer crime investigator, and asks him to find inconsistencies in the money transfers.

Here is a sample transaction log of the company:
Feb SLR 4 M
Feb ENT 800 K
Mar SLR 4000 K
Mar ENT 800 K
Apr SLR 4010 K
Apr ENT 810 K

There are four columns:
1. Month of the transaction
2. Reason of the expense (SLR for "salary", ENT for "entertainment", OTR for "other")
3. Amount
4. M, K, or B (M for million, K for thousands, B for billion)

In the example above, April expenses show an inconsistency and should be reported.

Another example:
Jul SLR 4 M
Jul ENR 800 K
Jul OTR 1200 K
Aug SLR 4000 K
Aug ENR 800 K
Aug OTR 1190 K
Sep SLR 4000 K
Sep ENR 800 K
Sep OTR 1190 K

Here, July expenses show an inconsistency and should be reported..

As the computer investigator, write a program, which reads the transaction logs, detects inconsistent expenses and prints the exact month containing the "unusual" activities.


> The number of lines in the transaction log, as well as the reasons, are not fixed and can contain other values.
*/
module paranoia

const (
	full_month = {
		'Jan': 'January'
		'Feb': 'February'
		'Mar': 'March'
		'Apr': 'April'
		'May': 'Mai'
		'Jun': 'June'
		'Jul': 'July'
		'Aug': 'August'
		'Sep': 'September'
		'Oct': 'October'
		'Nov': 'November'
		'Dec': 'December'
	}
)

pub enum Reason {
	slr
	ent
	otr
}

struct Transaction {
pub mut:
	month  string
	reason Reason
	amount int
	unit   byte
}

pub fn get_inconsistency(transaction_log []Transaction) ?string {
	mut trans_log := transaction_log
	unify_expense_amounts(mut trans_log) or {
		return error(err)
	}
	return ''
}

fn unify_expense_amounts(mut transaction_log []Transaction) ? {
	for i, trans in transaction_log {
		match trans.unit {
			`k`, `K` {}
			`m`, `M` {
				transaction_log[i].amount = trans.amount * 1000
				transaction_log[i].unit = `K`
			}
			`b`, `B` {
				transaction_log[i].amount = trans.amount * 1000 * 1000
				transaction_log[i].unit = `K`
			}
			else {
				return error('Unknown expense amount unit `${trans.unit.str()}`')
			}
		}
	}
}

fn get_expenses_by_month(transaction_log []Transaction) map[string][]int {
	mut month_expenses := map[string][]int
	for trans in transaction_log {
		if trans.month !in month_expenses {
			month_expenses[trans.month] = [0, 0, 0]
		}
		match trans.reason {
			.slr {
				month_expenses[trans.month][0] = trans.amount
			}
			.ent {
				month_expenses[trans.month][1] = trans.amount
			}
			.otr {
				month_expenses[trans.month][2] = trans.amount
			}
		}
	}
	return month_expenses
}
