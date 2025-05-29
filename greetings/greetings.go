package greetings

import (
	"errors"
	"fmt"
	"math/rand"
)

func Hello(name string) (string, error) {

	if name == "" {
		return "", errors.New("no name was given")
	}

	message := fmt.Sprintf(randomFormat(), name)
	return message, nil
}

func randomFormat() string {
	// S slice of message formats
	formats := []string{
		"Hi, %v. Welcome",
		"Great to see you %v!",
		"Hail, %v! Well met!",
	}

	return formats[rand.Intn(len(formats))]
}
