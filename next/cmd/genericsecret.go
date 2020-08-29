package cmd

import (
	"bytes"
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strings"

	"github.com/twpayne/chezmoi/next/internal/chezmoi"
)

type genericSecretConfig struct {
	Command   string
	cache     map[string]string
	jsonCache map[string]interface{}
}

func (c *Config) secretFunc(args ...string) string {
	key := strings.Join(args, "\x00")
	if value, ok := c.GenericSecret.cache[key]; ok {
		return value
	}
	name := c.GenericSecret.Command
	cmd := exec.Command(name, args...)
	cmd.Stdin = os.Stdin
	cmd.Stderr = os.Stderr
	output, err := c.baseSystem.IdempotentCmdOutput(cmd)
	if err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", name, chezmoi.ShellQuoteArgs(args), err, output))
	}
	value := string(bytes.TrimSpace(output))
	if c.GenericSecret.cache == nil {
		c.GenericSecret.cache = make(map[string]string)
	}
	c.GenericSecret.cache[key] = value
	return value
}

func (c *Config) secretJSONFunc(args ...string) interface{} {
	key := strings.Join(args, "\x00")
	if value, ok := c.GenericSecret.jsonCache[key]; ok {
		return value
	}
	name := c.GenericSecret.Command
	cmd := exec.Command(name, args...)
	cmd.Stdin = os.Stdin
	cmd.Stderr = os.Stderr
	output, err := c.baseSystem.IdempotentCmdOutput(cmd)
	if err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", name, chezmoi.ShellQuoteArgs(args), err, output))
	}
	var value interface{}
	if err := json.Unmarshal(output, &value); err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", name, chezmoi.ShellQuoteArgs(args), err, output))
	}
	if c.GenericSecret.jsonCache == nil {
		c.GenericSecret.jsonCache = make(map[string]interface{})
	}
	c.GenericSecret.jsonCache[key] = value
	return value
}
