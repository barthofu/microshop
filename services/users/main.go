package main

import (
	"fmt"
	"net/http"
	"os"
	"log"
)

func main() {

	file, err := os.Create("/var/log/users-service.log")
	if err != nil {
		fmt.Println("Error creating log file")
		return
	}
	log.SetOutput(file)
	defer file.Close()

	log.Println("Server is running on port 8080")

	http.HandleFunc("/", Handler)
	http.ListenAndServe(":8080", nil)
}

func Handler(w http.ResponseWriter, r *http.Request) {

	apiKey := os.Getenv("API_KEY")
	log.Println("API key is: ", apiKey)

	fmt.Fprintf(w, "Hello world from Users-Service")
}
