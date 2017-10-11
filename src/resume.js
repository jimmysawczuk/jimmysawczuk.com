import "../less/resume.less"

const revision = JSON.parse(require("../REVISION.json"))

for (var el of document.querySelectorAll(".revision")) {
	el.innerHTML = `<a href="https://github.com/jimmysawczuk/jimmysawczuk.com/commit/${revision
		.hex.full}">rev. ${revision.hex.short}</a>`
}

document.getElementById(
	"revision-date",
).innerHTML = `Last modified on <span class="date" data-format="MMMM D, YYYY" data-date="${revision
	.commit_date.iso8601}"></span>`

for (var el of document.querySelectorAll(".date")) {
	let fmt = el.dataset.format
	let m

	if (el.dataset.date == undefined) {
		m = new Date()
	} else {
		m = new Date(el.dataset.date)
	}

	const replacements = [
		{
			code: "MMMM",
			func: d =>
				({
					0: "January",
					1: "February",
					2: "March",
					3: "April",
					4: "May",
					5: "June",
					6: "July",
					7: "August",
					8: "September",
					9: "October",
					10: "November",
					11: "December",
				}[d.getUTCMonth()]),
		},
		{
			code: "D",
			func: d => d.getUTCDate(),
		},
		{
			code: "YYYY",
			func: d => d.getUTCFullYear(),
		},
	]

	for (let repl of replacements) {
		fmt = fmt.replace(repl.code, repl.func(m))
	}

	el.innerHTML = fmt
}
