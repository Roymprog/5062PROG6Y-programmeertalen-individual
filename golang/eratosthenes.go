/*
*		Author: Roy van Santen	-  6081282
*
*		This program takes as command line argument a number greater or equal to 2
*		and will print all prime numbers starting from 2 up to the defined number n.
*		The prime number output will be printed to stdout.
*
 */

package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	args := os.Args

	// Accept exactly 1 command line argument, ignoring program name as argument
	if cap(args) != 2 {
		fmt.Println("Need at least, and not more than, 1 command line arguments")
		return
	}

	// Convert input to integer
	n, err := strconv.Atoi(args[1])

	// Ensure input can be converted to integer
	if err != nil {
		fmt.Println("Could not convert input string to int value")
		return
	}

	// Do not accept integers smaller or equal to 1
	if n <= 1 {
		fmt.Println("Please provide a number that is greater than one")
		return
	}

	// Generate channels to feed numbers and to end program
	allNumbers := make(chan int)
	done := make(chan int)

	// Initial filtering go-routine
	go filterNumbers(allNumbers, done)

	// Put all numbers in channels
	for i := 2; i <= n; i++ {
		allNumbers <- i
	}

	// All numbers have been passed in channel, channel can be closed
	close(allNumbers)

	// Wait till final channel is closed
	<-done
}

func filterNumbers(numbersLeft chan int, done chan int) {
	// Prime number is first number in new stream
	filterInt := <-numbersLeft
	fmt.Println(filterInt)

	// Make new channel to send non-filtered numbers to
	newList := make(chan int)

	// Ensure each number only starts one new goroutine
	goRoutineSpawned := false

	for {
		current, ok := <-numbersLeft
		if current%filterInt > 0 {
			if !goRoutineSpawned {
				go filterNumbers(newList, done)
				goRoutineSpawned = true
			}
			newList <- current
		} else if !ok {
			close(newList)
			// When previous stream is closed and current stream has
			// not spawned a new routine, no more primes can be found,
			// so we're done
			if !goRoutineSpawned {
				done <- 0
			}
			return
		}
	}
}
