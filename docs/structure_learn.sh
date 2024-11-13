#!/bin/bash

# Base directory for the project
base_dir="docs"

# Create the base directory structure if it doesn't already exist
mkdir -p "$base_dir"
cd "$base_dir" || exit

# Array for Teach German sections and their files
declare -A teach_sections
teach_sections=(
  ["Pedagogy"]="introduction.md methodologies.md classroom-management.md"
  ["Resources"]="books.md classes.md"
  ["Group Learning"]="organizing-group.md activities.md"
  ["Exam Preparation"]="tips.md practice-tests.md"
)

# Create directories and files with basic content for "Teach German"
for section in "${!teach_sections[@]}"; do
  # Convert section title to lowercase and replace spaces with hyphens
  dir_name=$(echo "$section" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  mkdir -p "teach-german/$dir_name"
  
  # Create each file in the section with basic content
  for file in ${teach_sections[$section]}; do
    file_path="teach-german/$dir_name/$file"
    cat <<EOF > "$file_path"
# ${section//-/ } - ${file%.md^}
Welcome to the $section section. Here you will find resources and guidance for ${file%.md}.
EOF
  done
done

echo "Teach German structure created successfully!"
