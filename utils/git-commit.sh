#!/usr/bin/env sh
# Uses charmbracelet gum to help write git commit messages in conventional commit's style

TYPE=$(gum choose "fix" "feat" "docs" "chore" "refactor" "test" "style" "revert")
SCOPE=$(gum input --placeholder "scope")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

# Commit these changes
echo "# $SUMMARY\n\n$DESCRIPTION" | gum format
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"