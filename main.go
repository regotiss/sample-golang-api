package main

import (
	"fmt"
	"net/http"
)

func main() {
	InitializeDB()
	router := InitilizeRoutes()
	err := http.ListenAndServe(":8085", router)
	if err != nil {
		fmt.Println("Could not start the server. Error: ", err)
	}
}
