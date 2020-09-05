module paranoia

fn test_get_inconsistencies() {
	transaction_logs := [
		[
			Transaction{
				month: 'Feb'
				reason: .slr
				amount: 4
				unit: `M`
			},
			Transaction{
				month: 'Feb'
				reason: .ent
				amount: 800
				unit: `K`
			},
			Transaction{
				month: 'Mar'
				reason: .slr
				amount: 4000
				unit: `K`
			},
			Transaction{
				month: 'Mar'
				reason: .ent
				amount: 800
				unit: `K`
			},
			Transaction{
				month: 'Apr'
				reason: .slr
				amount: 4010
				unit: `K`
			},
			Transaction{
				month: 'Apr'
				reason: .ent
				amount: 810
				unit: `K`
			},
		],
	]
	expected := [
		'April',
	]
	for i, log in transaction_logs {
		res := get_inconsistency(log) or {
			panic(err)
		}
		exp := expected[i]
		assert res == exp
	}
}

/*
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
*/

fn test_unify_expense_amounts() {
	mut transaction_log := [
		Transaction{
			amount: 4
			unit: `M`
		},
		Transaction{
			amount: 800
			unit: `K`
		},
		Transaction{
			amount: 2
			unit: `B`
		},
	]
	expected := [
		Transaction{
			amount: 4000
			unit: `K`
		},
		Transaction{
			amount: 800
			unit: `K`
		},
		Transaction{
			amount: 2000000
			unit: `K`
		},
	]
	unify_expense_amounts(mut transaction_log) or {
		panic(err)
	}
	assert transaction_log == expected
	mut invalid_log := [
		Transaction{
			amount: 4
			unit: `A`
		},
	]
	unify_expense_amounts(mut invalid_log) or {
		assert err == 'Unknown expense amount unit `A`'
	}
}

fn test_get_month_expenses() {
	mut transaction_log := [
		Transaction{
			month: 'Feb'
			reason: .slr
			amount: 2000
		},
		Transaction{
			month: 'Feb'
			reason: .ent
			amount: 400
		},
		Transaction{
			month: 'Feb'
			reason: .otr
			amount: 200
		},
		Transaction{
			month: 'Mar'
			reason: .slr
			amount: 4000
		},
		Transaction{
			month: 'Mar'
			reason: .ent
			amount: 800
		},
	]
	expected := {
		'Feb': [2000, 400, 200]
		'Mar': [4000, 800, 0]
	}
	res := get_expenses_by_month(transaction_log)
	assert res == expected
}
