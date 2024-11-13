#!/bin/bash

# Base directory for the project
base_dir="ib-languages"

# Create the base directory structure
# mkdir -p "$base_dir"
#cd "$base_dir" || exit

# Array for sections and their files
declare -A sections
sections=(
  ["Getting Started"]="germany.md austria.md switzerland.md"
  ["Level-Based Learning"]="a1.md a2.md b1.md b2.md c1.md c2.md"
  ["Language Certifications"]="goethe.md telc.md testdaf.md"
  ["Multimedia"]="tv-movies.md music-podcasts.md apps-games.md"
)

# Create directories and files with basic content
for section in "${!sections[@]}"; do
  # Convert section title to lowercase and replace spaces with hyphens
  dir_name=$(echo "$section" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  mkdir -p "learn-german/$dir_name"
  
  # Create each file in the section with basic content
  for file in ${sections[$section]}; do
    file_path="learn-german/$dir_name/$file"
    cat <<EOF > "$file_path"
# ${section//-/ } - ${file%.md^}
Welcome to the $section section. Here you will find resources for ${file%.md}.
EOF
  done
done

# Create extra files in root directory for "Home" and "Contributors"
echo "# Home" > index.md
echo "Welcome to IB-Languages!" >> index.md

echo "# Contributors" > participate.md
echo "This page lists the contributors to the project." >> participate.md

echo "Project structure created successfully!"
