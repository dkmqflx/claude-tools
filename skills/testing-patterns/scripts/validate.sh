#!/bin/bash
# Validates a test file against project testing conventions.
# Usage: bash scripts/validate.sh <test-file-path>

FILE="$1"
ERRORS=0

if [ -z "$FILE" ]; then
  echo "Usage: $0 <test-file-path>"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: file not found — $FILE"
  exit 1
fi

fail() {
  echo "FAIL: $1"
  ERRORS=$((ERRORS + 1))
}

# 1. File must be in src/features/{name}/test/
if ! echo "$FILE" | grep -qE "src/features/[^/]+/test/"; then
  fail "File must be under src/features/{name}/test/ (got: $FILE)"
fi

# 2. Must not use fireEvent
if grep -q "fireEvent" "$FILE"; then
  fail "Use userEvent instead of fireEvent"
fi

# 3. Must have at least one describe block
if ! grep -q "describe(" "$FILE"; then
  fail "Missing describe() block"
fi

# 4. it() descriptions should follow "should ... when ..." pattern
ITS=$(grep -oP "it\(['\"].*?['\"]" "$FILE")
while IFS= read -r line; do
  if [ -n "$line" ] && ! echo "$line" | grep -qiE "should .+ when "; then
    fail "it() description doesn't follow 'should ... when ...' pattern: $line"
  fi
done <<< "$ITS"

# 5. Must reset mocks in beforeEach
if grep -q "vi.fn()" "$FILE" && ! grep -q "beforeEach" "$FILE"; then
  fail "Missing beforeEach — mocks must be reset between tests"
fi

# 6. Must import from @testing-library/user-event if interacting with DOM
if grep -q "userEvent\|user\.click\|user\.type" "$FILE"; then
  if ! grep -q "@testing-library/user-event" "$FILE"; then
    fail "Missing import from @testing-library/user-event"
  fi
fi

# 7. Warn if Store.getState() is used in a component test (interface-based testing)
if echo "$FILE" | grep -qE "\.test\.tsx$"; then
  if grep -q "getState()" "$FILE"; then
    fail "Component test uses Store.getState() — prefer UI assertions (getByRole, getByText, getByTestId)"
  fi
fi

if [ "$ERRORS" -eq 0 ]; then
  echo "OK: $FILE passes all convention checks"
  exit 0
else
  echo ""
  echo "$ERRORS issue(s) found in $FILE"
  exit 1
fi
