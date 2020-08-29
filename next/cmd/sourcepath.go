package cmd

import (
	"path/filepath"
	"strings"

	"github.com/spf13/cobra"

	"github.com/twpayne/chezmoi/next/internal/chezmoi"
)

func (c *Config) newSourcePathCmd() *cobra.Command {
	sourcePathCmd := &cobra.Command{
		Use:     "source-path [targets...]",
		Short:   "Print the path of a target in the source state",
		Long:    mustGetLongHelp("source-path"),
		Example: getExample("source-path"),
		RunE:    c.makeRunEWithSourceState(c.runSourcePathCmd),
	}

	markRemainingZshCompPositionalArgumentsAsFiles(sourcePathCmd, 1)

	return sourcePathCmd
}

func (c *Config) runSourcePathCmd(cmd *cobra.Command, args []string, sourceState *chezmoi.SourceState) error {
	if len(args) == 0 {
		return c.writeOutputString(filepath.FromSlash(c.absSourceDir) + "\n")
	}

	sourcePaths, err := c.getSourcePaths(sourceState, args)
	if err != nil {
		return err
	}

	sb := &strings.Builder{}
	for _, sourcePath := range sourcePaths {
		sb.WriteString(filepath.FromSlash(sourcePath) + "\n")
	}
	return c.writeOutputString(sb.String())
}
