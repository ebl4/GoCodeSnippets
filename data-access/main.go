package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/microsoft/go-mssqldb"
)

var db *sql.DB

func main() {
	connString := "sqlserver://localhost?database=recordings&trusted_connection=true&encrypt=disable&user id=NT AUTHORITY\\NETWORK SERVICE"

	// Get a database handle.
	var err error
	db, err = sql.Open("sqlserver", connString)
	if err != nil {
		log.Fatal(err)
	}

	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}

	fmt.Println("Connected!")
}
