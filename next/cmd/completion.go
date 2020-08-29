package cmd

// FIXME update REFERENCE.md
// FIXME add per-shell Long and Example

import (
	"io"
	"strings"

	"github.com/spf13/cobra"
)

func (c *Config) newCompletionCmd(rootCmd *cobra.Command) *cobra.Command {
	completionCmd := &cobra.Command{
		Use:   "completion",
		Short: "Generate shell completion code",
		// Long:      mustGetLongHelp("completion"), // FIXME
		// Example:   getExample("completion"), // FIXME
	}

	makeRunE := func(genCompletionFunc func(io.Writer) error) func(*cobra.Command, []string) error {
		return func(cmd *cobra.Command, args []string) error {
			sb := &strings.Builder{}
			if err := genCompletionFunc(sb); err != nil {
				return err
			}
			return c.writeOutputString(sb.String())
		}
	}

	bashCmd := &cobra.Command{
		Use:   "bash",
		Short: "Generate bash completion code",
		// Long:      mustGetLongHelp("completion", "bash"), // FIXME
		// Example:   getExample("completion", "bash"), // FIXME
		RunE: makeRunE(rootCmd.GenBashCompletion),
		Args: cobra.NoArgs,
		Annotations: map[string]string{
			doesNotRequireValidConfig: "true",
		},
	}
	completionCmd.AddCommand(bashCmd)

	fishCmd := &cobra.Command{
		Use:   "fish",
		Args:  cobra.NoArgs,
		Short: "Generate fish completion code",
		// Long:      mustGetLongHelp("completion", "fish"), // FIXME
		// Example:   getExample("completion", "fish"), // FIXME
		RunE: makeRunE(func(w io.Writer) error {
			return rootCmd.GenFishCompletion(w, true)
		}),
		Annotations: map[string]string{
			doesNotRequireValidConfig: "true",
		},
	}
	completionCmd.AddCommand(fishCmd)

	powerShellCmd := &cobra.Command{
		Use:   "powershell",
		Args:  cobra.NoArgs,
		Short: "Generate PowerShell completion code",
		// Long:      mustGetLongHelp("completion", "powershell"), // FIXME
		// Example:   getExample("completion", "powershell"), // FIXME
		RunE: makeRunE(rootCmd.GenPowerShellCompletion),
		Annotations: map[string]string{
			doesNotRequireValidConfig: "true",
		},
	}
	completionCmd.AddCommand(powerShellCmd)

	zshCmd := &cobra.Command{
		Use:   "zsh",
		Args:  cobra.NoArgs,
		Short: "Generate zsh completion code",
		// Long:      mustGetLongHelp("completion", "zsh"), // FIXME
		// Example:   getExample("completion", "zsh"), // FIXME
		RunE: makeRunE(rootCmd.GenZshCompletion),
		Annotations: map[string]string{
			doesNotRequireValidConfig: "true",
		},
	}
	completionCmd.AddCommand(zshCmd)

	return completionCmd
}
