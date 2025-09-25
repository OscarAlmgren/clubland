#!/usr/bin/env python3
"""
Enhanced script to automatically add missing documentation to Dart files.
This script processes Flutter analyzer output and adds contextually appropriate
documentation to public members.
"""

import re
import os
import subprocess
import json
from pathlib import Path

class DocGenerator:
    """Generates context-aware documentation for Dart code elements."""

    def __init__(self):
        # Map common patterns to documentation templates
        self.doc_patterns = {
            # Classes
            'class': {
                'Service': 'Service for {name}',
                'Repository': 'Repository for {name} data operations',
                'Provider': 'Provider for {name}',
                'Controller': 'Controller for {name}',
                'Widget': 'Widget for {name}',
                'Manager': 'Manager for {name}',
                'Config': 'Configuration for {name}',
                'Exception': 'Exception for {name}',
                'Failure': 'Failure for {name}',
                'default': '{name} class'
            },

            # Enum values
            'enum_value': {
                'development': 'Development environment',
                'staging': 'Staging environment',
                'production': 'Production environment',
                'pending': 'Pending status',
                'active': 'Active status',
                'inactive': 'Inactive status',
                'verified': 'Verified status',
                'default': '{name} option'
            },

            # Storage keys
            'storage_key': {
                'token': 'Authentication token storage key',
                'id': 'ID storage key',
                'email': 'Email storage key',
                'name': 'Name storage key',
                'enabled': 'Enabled setting storage key',
                'time': 'Time storage key',
                'size': 'Size storage key',
                'mode': 'Mode storage key',
                'key': 'Key storage key',
                'box': 'Storage box name',
                'default': 'Storage key for {name}'
            },

            # Constants
            'constant': {
                'timeout': 'Timeout duration',
                'delay': 'Delay duration',
                'size': 'Size value',
                'limit': 'Limit value',
                'max': 'Maximum value',
                'min': 'Minimum value',
                'default': 'Default value',
                'url': 'URL constant',
                'endpoint': 'API endpoint',
                'default_const': 'Constant value'
            },

            # Methods
            'method': {
                'get': 'Gets {name}',
                'set': 'Sets {name}',
                'create': 'Creates {name}',
                'update': 'Updates {name}',
                'delete': 'Deletes {name}',
                'fetch': 'Fetches {name}',
                'save': 'Saves {name}',
                'load': 'Loads {name}',
                'init': 'Initializes {name}',
                'dispose': 'Disposes {name}',
                'build': 'Builds {name}',
                'execute': 'Executes {name}',
                'validate': 'Validates {name}',
                'default': 'Method for {name}'
            }
        }

    def extract_name_from_line(self, line):
        """Extract the name of the element from the code line."""
        line = line.strip()

        # Class names
        if line.startswith('class '):
            match = re.search(r'class\s+(\w+)', line)
            if match:
                return match.group(1)

        # Enum names
        elif line.startswith('enum '):
            match = re.search(r'enum\s+(\w+)', line)
            if match:
                return match.group(1)

        # Static constants
        elif 'static const' in line:
            match = re.search(r'static const\s+\w+\s+(\w+)', line)
            if match:
                return match.group(1)

        # Methods and getters
        elif 'get ' in line:
            match = re.search(r'get\s+(\w+)', line)
            if match:
                return match.group(1)

        elif 'set ' in line:
            match = re.search(r'set\s+(\w+)', line)
            if match:
                return match.group(1)

        # Function/method names
        elif '(' in line and not line.strip().startswith('//'):
            # Try to extract function name
            match = re.search(r'(\w+)\s*\(', line)
            if match:
                return match.group(1)

        # Enum values
        elif ',' in line or '}' in line:
            match = re.search(r'(\w+)(?:\s*,|\s*})', line)
            if match:
                return match.group(1)

        return None

    def categorize_element(self, line, file_path):
        """Categorize the element type based on context."""
        line = line.strip().lower()
        file_name = os.path.basename(file_path).lower()

        if line.startswith('class '):
            return 'class'
        elif line.startswith('enum '):
            return 'enum'
        elif 'storage_keys' in file_name and 'static const string' in line:
            return 'storage_key'
        elif 'constants' in file_name and 'static const' in line:
            return 'constant'
        elif 'get ' in line:
            return 'method'
        elif 'set ' in line:
            return 'method'
        elif line.endswith(',') or line.endswith('}'):
            return 'enum_value'
        else:
            return 'default'

    def generate_doc(self, line, file_path):
        """Generate appropriate documentation for the given line."""
        name = self.extract_name_from_line(line)
        if not name:
            return "/// Public member"

        category = self.categorize_element(line, file_path)

        # Convert camelCase to readable format
        readable_name = re.sub(r'([A-Z])', r' \1', name).strip().lower()
        readable_name = readable_name.replace('_', ' ')

        # Get pattern category
        patterns = self.doc_patterns.get(category, {})

        # Find matching pattern
        doc_template = patterns.get('default', 'Public member for {name}')
        for key, template in patterns.items():
            if key in readable_name:
                doc_template = template
                break

        # Format the template
        try:
            return f"/// {doc_template.format(name=readable_name)}"
        except:
            return f"/// {readable_name.title()}"

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
    debug_count = 0

    for line in lines:
        if 'Missing documentation for a public member' in line:
            debug_count += 1
            if debug_count <= 3:  # Debug first 3 matches
                print(f"Debug line: {repr(line)}")

            # Extract file path and line number
            # Format: "   info • Missing documentation for a public member • lib/path/file.dart:123:45 • public_member_api_docs"
            match = re.search(r'•\s+(.+):(\d+):\d+\s+•', line)
            if match:
                file_path = match.group(1)
                line_num = int(match.group(2))
                issues.append((file_path, line_num))
                if debug_count <= 3:
                    print(f"  Matched: {file_path}:{line_num}")
            elif debug_count <= 3:
                print(f"  No match for regex")

    print(f"Total documentation lines found: {debug_count}")
    return issues

def add_documentation_to_file(file_path, line_numbers, doc_generator):
    """Add documentation comments to specified lines in a file."""
    if not os.path.exists(file_path):
        return

    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
    except UnicodeDecodeError:
        print(f"Warning: Could not read {file_path} - skipping")
        return

    # Sort line numbers in reverse order to avoid index shifting
    line_numbers = sorted(set(line_numbers), reverse=True)

    for line_num in line_numbers:
        if line_num <= len(lines):
            # Get the line content (1-indexed to 0-indexed)
            line_content = lines[line_num - 1]
            doc_comment = doc_generator.generate_doc(line_content, file_path)

            # Get indentation from the original line
            indent = re.match(r'(\s*)', line_content).group(1)

            # Insert documentation comment before the line
            lines.insert(line_num - 1, f"{indent}{doc_comment}\n")

    # Write back to file
    try:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.writelines(lines)
    except Exception as e:
        print(f"Error writing to {file_path}: {e}")

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

    # Initialize documentation generator
    doc_generator = DocGenerator()

    # Process each file
    processed_files = 0
    for file_path, line_numbers in file_issues.items():
        print(f"Processing {file_path} ({len(line_numbers)} issues)...")
        add_documentation_to_file(file_path, line_numbers, doc_generator)
        processed_files += 1

        # Progress update every 10 files
        if processed_files % 10 == 0:
            print(f"  Processed {processed_files}/{len(file_issues)} files...")

    print(f"Documentation added to {processed_files} files!")
    print("Running analyzer again to verify...")

    # Run analyzer again to check results
    new_output = run_analyzer()
    new_issues = parse_analyzer_output(new_output)
    original_count = len(issues)
    remaining_count = len(new_issues)
    fixed_count = original_count - remaining_count

    print(f"Original issues: {original_count}")
    print(f"Remaining issues: {remaining_count}")
    print(f"Fixed issues: {fixed_count}")

    if fixed_count > 0:
        print(f"Success! Fixed {fixed_count} documentation issues ({fixed_count/original_count*100:.1f}%)")
    else:
        print("No issues were fixed. Please check the script logic.")

if __name__ == '__main__':
    main()