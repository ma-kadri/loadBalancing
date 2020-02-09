package main

import (
	"fmt"
	"net/http"
	"github.com/gorilla/mux"
)

func test(rw http.ResponseWriter, r *http.Request) {
	fmt.Fprint(rw, "v1")
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", test)
	address := "0.0.0.0:8000"
	fmt.Printf("Starting http server on %s\n", address)
	http.ListenAndServe(address, r)
}