package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("Server is running on port 8080")
	http.HandleFunc("/", Handler)
	http.ListenAndServe(":8080", nil)
}

func Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world!")
}
