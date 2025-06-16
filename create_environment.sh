#!/bin/bash

# Prompt for user name
read -p "Enter your user name: " user_name
dir="submission_reminder_${user_name}"

# Create directories
mkdir -p "$dir/app" 
mkdir -p "$dir/config" 
mkdir -p "$dir/modules" 
mkdir -p "$dir/assets"


# config.env
cat << 'EOF' > "$dir/config/config.env" 
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
# submissions.txt
cat << EOF > "$dir/assets/submissions.txt"
#submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
#add 5 more students
MILO, Shell Navigation,  submitted
DIPO, Git, submitted
MOSES, Shell Navigation, not submitted
LOLO, Shell Basics, submitted
EOF
# reminder.sh
cat << 'EOF' > "$dir/app/reminder.sh" 
#!/bin/bash
source ./config/config.env
source ./modules/functions.sh

# 
submissions_file="./assets/submissions.txt"

# 
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF
# functions.sh
cat << 'EOF' > "$dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
# Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") #skip the header
}

EOF

# startup.sh
cat << 'EOF' > "$dir/startup.sh"
#!/bin/bash
source config/config.env
source modules/functions.sh
bash app/reminder.sh
EOF

# Make scripts executable
find "$dir" -type f -name "*.sh" -exec chmod +x {} \;

echo " Environment setup created in '$dir'."
