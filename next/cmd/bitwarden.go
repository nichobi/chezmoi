package cmd

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strings"

	"github.com/twpayne/chezmoi/next/internal/chezmoi"
)

type bitwardenConfig struct {
	Command     string
	outputCache map[string][]byte
}

func (c *Config) bitwardenOutput(args []string) []byte {
	key := strings.Join(args, "\x00")
	if data, ok := c.Bitwarden.outputCache[key]; ok {
		return data
	}

	name := c.Bitwarden.Command
	args = append([]string{"get"}, args...)
	cmd := exec.Command(name, args...)
	cmd.Stdin = os.Stdin
	cmd.Stderr = os.Stderr
	output, err := c.baseSystem.IdempotentCmdOutput(cmd)
	if err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", name, chezmoi.ShellQuoteArgs(args), err, output))
	}

	if c.Bitwarden.outputCache == nil {
		c.Bitwarden.outputCache = make(map[string][]byte)
	}
	c.Bitwarden.outputCache[key] = output
	return output
}

func (c *Config) bitwardenFunc(args ...string) map[string]interface{} {
	output := c.bitwardenOutput(args)
	var data map[string]interface{}
	if err := json.Unmarshal(output, &data); err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", c.Bitwarden.Command, chezmoi.ShellQuoteArgs(args), err, output))
	}
	return data
}

func (c *Config) bitwardenFieldsFunc(args ...string) map[string]interface{} {
	output := c.bitwardenOutput(args)
	var data struct {
		Fields []map[string]interface{} `json:"fields"`
	}
	if err := json.Unmarshal(output, &data); err != nil {
		panic(fmt.Errorf("%s %s: %w\n%s", c.Bitwarden.Command, chezmoi.ShellQuoteArgs(args), err, output))
	}
	result := make(map[string]interface{})
	for _, field := range data.Fields {
		if name, ok := field["name"].(string); ok {
			result[name] = field
		}
	}
	return result
}
