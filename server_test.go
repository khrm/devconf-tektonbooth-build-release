package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHelloServer(t *testing.T) {
	ts := httptest.NewServer(http.HandlerFunc((HelloServer)))
	defer ts.Close()

	res, err := http.Get(ts.URL)
	if err != nil {
		t.Error("Error while requesting in TestHelloServer: ", err)
	}
	resp, err := ioutil.ReadAll(res.Body)
	res.Body.Close()
	if err != nil {
		t.Error("Error while reading response in TestHelloServer: ",
			err)
	}
	if string(resp) != fmt.Sprintf(greeting, "") {
		t.Error("Unexpected response: ", string(resp))
	}
}
