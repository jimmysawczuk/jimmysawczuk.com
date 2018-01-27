package main

import (
	"encoding/json"
	"fmt"
	"html/template"
	"io/ioutil"
	"os"
	"regexp"
	"runtime"
	"time"
)

type goEnv struct {
	OS   string
	Arch string
	Ver  string
}

type payload struct {
	Date     time.Time
	Env      string
	Hostname string
	GoEnv    goEnv
	Asset    func(string, string) string
}

type output struct {
	payload
}

func getHostname() string {
	v, _ := os.Hostname()
	return v
}

func main() {
	o := payload{
		Date:     time.Now(),
		Env:      os.Getenv("MODE"),
		Hostname: getHostname(),
		GoEnv: goEnv{
			Ver:  runtime.Version(),
			OS:   runtime.GOOS,
			Arch: runtime.GOARCH,
		},
	}

	if len(os.Args) == 1 {
		js, _ := json.Marshal(o)
		fmt.Printf("%s\n", string(js))
		return
	} else if len(os.Args) == 2 {
		tmplStr, err := ioutil.ReadFile(os.Args[1])
		if err != nil {
			fmt.Fprintf(os.Stderr, "error loading template file %s: %s", os.Args[1], err)
			os.Exit(2)
		}

		tmpl := template.New("output").Funcs(map[string]interface{}{
			"asset":   loadAsset(o.Date, o.Env),
			"getJSON": getJSON,
			"now":     func() time.Time { return o.Date },
			"parseTime": func(s string) (time.Time, error) {
				return time.Parse(time.RFC3339, s)
			},
			"formatTime": func(f string, t time.Time) string {
				return t.Format(f)
			},
		})

		tmpl, err = tmpl.Parse(string(tmplStr))
		if err != nil {
			fmt.Fprintf(os.Stderr, "error compiling template %s: %s\n", os.Args[1], err)
			os.Exit(2)
		}

		err = tmpl.Execute(os.Stdout, o)
		if err != nil {
			fmt.Fprintf(os.Stderr, "error executing template: %s", err)
			os.Exit(2)
		}
	}
}

func loadAsset(now time.Time, mode string) func(path string) string {
	timestampRegexp := regexp.MustCompile(`\.(\w+)$`)

	return func(path string) string {
		if mode == "production" {
			return timestampRegexp.ReplaceAllString(path, fmt.Sprintf(".%d.$1", now.Unix()))
		}

		return path
	}
}

func getJSON(path string) (interface{}, error) {
	by, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var target interface{}
	err = json.Unmarshal(by, &target)
	if err != nil {
		return nil, err
	}

	return target, nil
}
