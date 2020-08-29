// +build !windows

package main

import "syscall"

func setUmask(umask int) {
	syscall.Umask(umask)
}
