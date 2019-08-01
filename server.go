package main

import (
	"fmt"
	"net/http"
)

const (
	greeting = "Hello, %s! \n" +
		"Checkout release at" +
		" https://github.com/khrm/devconf-tektonbooth-build-release/releases"
)

func main() {
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, greeting,
		r.URL.Path[1:])
}
