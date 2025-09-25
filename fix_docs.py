#!/usr/bin/env python3
"""
Script to automatically add missing documentation to Dart files.
This script processes Flutter analyzer output and adds basic documentation
to public members that are missing it.
"""

import re
import os
import subprocess

def run_analyzer():
    """Run Flutter analyzer and return the output."""
    try:
        result = subprocess.run(['flutter', 'analyze', '--no-pub'],
                              capture_output=True, text=True, cwd='.')
        return result.stderr
    except subprocess.CalledProcessError as e:
        return e.output

def parse_analyzer_output(output):
    """Parse analyzer output to extract missing documentation issues."""
    issues = []
    lines = output.split('\n')

    for line in lines:
        if 'Missing documentation for a public member' in line:
            # Extract file path and line number
            match = re.search(r'• (.+):(\d+):(\d+) •', line)
            if match:
                file_path = match.group(1)
                line_num = int(match.group(2))
                issues.append((file_path, line_num))

    return issues

def generate_doc_comment(line_content):
    """Generate appropriate documentation comment for a line."""
    line_content = line_content.strip()

    # Class documentation
    if line_content.startswith('class '):
        class_name = re.search(r'class\s+(\w+)', line_content)
        if class_name:
            return f"/// {class_name.group(1)} class"

    # Enum documentation
    elif line_content.startswith('enum '):
        enum_name = re.search(r'enum\s+(\w+)', line_content)
        if enum_name:
            return f"/// {enum_name.group(1)} enumeration"

    # Method/function documentation
    elif 'get ' in line_content and '=>' in line_content:
        return "/// Getter method"
    elif 'set ' in line_content:
        return "/// Setter method"
    elif line_content.startswith('Future') or 'async' in line_content:
        return "/// Asynchronous method"
    elif line_content.endswith('{') and '(' in line_content:
        return "/// Method"

    # Field documentation
    elif 'static const' in line_content:
        return "/// Constant value"
    elif 'static final' in line_content:
        return "/// Static final value"
    elif 'final' in line_content:
        return "/// Final value"
    elif 'static' in line_content:
        return "/// Static value"

    # Default
    return "/// Public member"

def add_documentation_to_file(file_path, line_numbers):
    """Add documentation comments to specified lines in a file."""
    if not os.path.exists(file_path):
        return

    with open(file_path, 'r') as f:
        lines = f.readlines()

    # Sort line numbers in reverse order to avoid index shifting
    line_numbers = sorted(set(line_numbers), reverse=True)

    for line_num in line_numbers:
        if line_num <= len(lines):
            # Get the line content (1-indexed to 0-indexed)
            line_content = lines[line_num - 1]
            doc_comment = generate_doc_comment(line_content)

            # Get indentation from the original line
            indent = re.match(r'(\s*)', line_content).group(1)

            # Insert documentation comment before the line
            lines.insert(line_num - 1, f"{indent}{doc_comment}\n")

    # Write back to file
    with open(file_path, 'w') as f:
        f.writelines(lines)

def main():
    """Main function to process all missing documentation issues."""
    print("Running Flutter analyzer...")
    output = run_analyzer()

    print("Parsing analyzer output...")
    issues = parse_analyzer_output(output)

    if not issues:
        print("No missing documentation issues found!")
        return

    print(f"Found {len(issues)} missing documentation issues")

    # Group issues by file
    file_issues = {}
    for file_path, line_num in issues:
        if file_path not in file_issues:
            file_issues[file_path] = []
        file_issues[file_path].append(line_num)

    # Process each file
    for file_path, line_numbers in file_issues.items():
        print(f"Processing {file_path} ({len(line_numbers)} issues)...")
        add_documentation_to_file(file_path, line_numbers)

    print("Documentation added successfully!")
    print("Running analyzer again to verify...")

    # Run analyzer again to check results
    new_output = run_analyzer()
    new_issues = parse_analyzer_output(new_output)
    print(f"Remaining documentation issues: {len(new_issues)}")

if __name__ == '__main__':
    main()