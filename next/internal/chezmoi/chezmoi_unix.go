// +build !windows

package chezmoi

import (
	"os"
	"syscall"
)

func init() {
	Umask = os.FileMode(syscall.Umask(0))
	syscall.Umask(int(Umask))
}
