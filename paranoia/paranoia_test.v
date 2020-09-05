module paranoia

fn test_get_inconsistencies() {
	transaction_logs := [
		[
			Transaction{
				month: 'Feb'
				reason: .slr
				amount: 4
				size: `M`
			},
			Transaction{
				month: 'Feb'
				reason: .ent
				amount: 800
				size: `K`
			},
			Transaction{
				month: 'Mar'
				reason: .slr
				amount: 4000
				size: `K`
			},
			Transaction{
				month: 'Mar'
				reason: .ent
				amount: 800
				size: `K`
			},
			Transaction{
				month: 'Apr'
				reason: .slr
				amount: 4010
				size: `K`
			},
			Transaction{
				month: 'Apr'
				reason: .ent
				amount: 810
				size: `K`
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
			size: `M`
		},
		Transaction{
			amount: 800
			size: `K`
		},
		Transaction{
			amount: 2
			size: `B`
		},
	]
	expected := [
		Transaction{
			amount: 4000
			size: `K`
		},
		Transaction{
			amount: 800
			size: `K`
		},
		Transaction{
			amount: 2000000
			size: `K`
		},
	]
	unify_expense_amounts(mut transaction_log) or {
		panic(err)
	}
	assert transaction_log == expected
	mut invalid_log := [
		Transaction{
			amount: 4
			size: `A`
		},
	]
	unify_expense_amounts(mut invalid_log) or {
		assert err == 'Unknown expense size `A`'
	}
}
