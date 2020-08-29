package cmd

import (
	"bytes"
	"fmt"
	"os"
	"os/exec"

	"github.com/twpayne/chezmoi/next/internal/chezmoi"
)

type passlikeConfig struct {
	Command string
	cache   map[string]string
}

func (c *Config) passlikeFunc(passConfig *passlikeConfig, id string) string {
	if s, ok := passConfig.cache[id]; ok {
		return s
	}
	name := passConfig.Command
	args := []string{"show", id}
	cmd := exec.Command(name, args...)
	cmd.Stdin = os.Stdin
	cmd.Stderr = os.Stderr
	output, err := c.baseSystem.IdempotentCmdOutput(cmd)
	if err != nil {
		panic(fmt.Errorf("%s %s: %w", name, chezmoi.ShellQuoteArgs(args), err))
	}
	var password string
	if index := bytes.IndexByte(output, '\n'); index != -1 {
		password = string(output[:index])
	} else {
		password = string(output)
	}
	if passConfig.cache == nil {
		passConfig.cache = make(map[string]string)
	}
	passConfig.cache[id] = password
	return password
}
