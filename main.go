package main

import "github.com/DataDog/go-python3"

func main() {

	defer python3.Py_Finalize()
	python3.Py_Initialize()
	python3.PyRun_SimpleString("print('hello from python in go')")

}
