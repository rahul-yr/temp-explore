package main

import (
	"io"
	"net/http"
	"os"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func getData(w http.ResponseWriter, r *http.Request) {
	tenantId := chi.URLParam(r, "tenantId")
	fileName := tenantId + ".json"
	// read json data from current path
	f, err := os.Open(fileName)
	if err != nil {
		// return empty json
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte("{}"))
		return
	}
	defer f.Close()

	w.Header().Set("Content-Type", "application/json")
	io.Copy(w, f) // Stream the file content directly
	return

}

func main() {
	r := chi.NewRouter()
	// A good base middleware stack
	r.Use(middleware.RequestID)
	r.Use(middleware.RealIP)
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)

	r.Get("/{tenantId}", getData)

	http.ListenAndServe(":8080", r)
}
