package main

import (
	"fmt"
	"net/http"
	"sample/init"
)

func main() {
	init.InitializeDB()
	router := init.InitilizeRoutes()
	err := http.ListenAndServe(":8085", router)
	if err != nil {
		fmt.Println("Could not start the server. Error: ", err)
	}
}
