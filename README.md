# submission_reminder_app_nirere123
# 📌 Submission Reminder App

Welcome to the **Submission Reminder App** — a shell-based application designed to remind students of their pending assignment submissions. This project showcases automation, scripting logic, and version control.

---

## 📁 Project Structure

submission_reminder_{yourName}/
│
├── config/
│ └── config.env
│
├── scripts/
│ ├── reminder.sh
│ ├── functions.sh
│ └── startup.sh
│
├── data/
│ └── submissions.txt
│
├── assets/
│ └── image.png
│
└── create_environment.sh
└── copilot_shell_script.sh
└── README.md

markdown
Copy
Edit

---

## ✅ Task Overview

### 🧪 Task 1: Environment Setup

Create a setup script called `create_environment.sh` that:

- Prompts the user for their name.
- Creates a directory named `submission_reminder_{yourName}`.
- Inside that directory, creates the following subdirectories:
  - `config/`, `scripts/`, `data/`, `assets/`
- Populates the folders with the provided files:
  - `config.env` → in `config/`
  - `reminder.sh`, `functions.sh`, and your custom `startup.sh` → in `scripts/`
  - `submissions.txt` (with 5+ new student records) → in `data/`
  - `image.png` → in `assets/`
- Makes all `.sh` files inside the project executable.

### 🚀 Task 2: Copilot Script

The `copilot_shell_script.sh` script:

- Prompts the user to enter a **new assignment name**.
- Updates the value of `ASSIGNMENT` in `config/config.env`.
- After updating, runs the `startup.sh` script to check who hasn’t submitted.

### 🌱 Task 3: Git Branching Workflow

Your GitHub repository should:

- Be named: `submission_reminder_app_{yourGitHubUsername}`
- Contain only the **final files** in the main branch:
  - `create_environment.sh`
  - `copilot_shell_script.sh`
  - `README.md`
- Use at least one **feature branch** for development (e.g., `feature/setup`).

---

## ⚙️ How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/yourGitHubUsername/submission_reminder_app_yourGitHubUsername.git
cd submission_reminder_app_yourGitHubUsername
2. Run the Setup Script
bash
Copy
Edit
chmod +x create_environment.sh
./create_environment.sh
Follow the prompt to enter your name. It will create the full environment automatically.

3. Test the Application
bash
Copy
Edit
cd submission_reminder_{yourName}/scripts
./startup.sh
4. Use the Copilot Script to Update Assignment
bash
Copy
Edit
cd ../..
chmod +x copilot_shell_script.sh
./copilot_shell_script.sh
Enter a new assignment name. It will update the environment and run the reminder check again.

💡 Learning Objectives
✔️ Master Shell scripting basics
✔️ Understand application directory structures
✔️ Learn to automate workflows
✔️ Develop Git branching and collaboration skills
✔️ Build and test a functional CLI app from scratch

🏁 Submission Checklist
✅ create_environment.sh
✅ copilot_shell_script.sh
✅ README.md
✅ Functional startup.sh
✅ At least 5 new entries in submissions.txt
✅ Correct file organization
✅ Main branch contains only the final files
✅ Feature branch used for development

🔍 Example Config (config.env)
env
Copy
Edit
ASSIGNMENT=Assignment_1
REMINDER_DAYS=3
📜 Example Submission Entry (submissions.txt)
css
Copy
Edit
StudentName, StudentEmail, Assignment_1, Submitted
John Doe, john@example.com, Assignment_1.
