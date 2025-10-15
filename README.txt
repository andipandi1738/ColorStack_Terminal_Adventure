🧠 ColorStack Terminal Adventure
A beginner Linux adventure for detectives-in-training.

🎯 YOUR MISSION
Something strange happened in the EEB lab. Use your terminal skills to explore folders,
read files, uncover clues, and discover what really happened.

You’ll move through four folders:
1. crime_scene – where it all began
2. suspects_locked – where secrets hide
3. evidence_locked – where proof waits
4. finale_locked – where you make your accusation

Each folder unlocks the next when you discover and enter the correct password.

🧭 BASIC COMMANDS YOU’LL NEED

| Purpose | Command | Example |
|----------|----------|----------|
| List files | ls | ls |
| Read a file | cat filename.txt | cat report.txt |
| Move into a folder | cd foldername | cd crime_scene |
| Go up one level | cd .. | |
| Return home | cd ~ | |
| See where you are | pwd | |
| Create or edit a small file | echo "text" > file.txt | |
| Run a script | bash scriptname.sh | |

💡 Pro tip: Files or folders starting with a dot (.) are hidden. Use ls -a to reveal them.

🚦 HOW TO PLAY

CHECKPOINT 1:
   cd ~/ColorStack_Terminal_Adventure/homes/detective
   cd homes.txt
   cd detective
   cat notes.txt

CHECKPOINT 2:
Investigate the crime scene to find your first clue.

CHECKPOINT 3:
Unlock new folders by:
   - Opening the relevant password.txt file
   - Typing your guessed password
   - Running the provided unlock script

CHECKPOINT 4:
Keep notes. Details matter — names, objects, and phrases might become passwords later.

In the finale, create a file named culprit.txt containing your final guess, then run:
bash reveal.sh

🧩 TROUBLESHOOTING TIPS
- If a script won’t run, make sure you’re in the right folder (use pwd).
- Use cat to re-read clues anytime.
- Use ls -a if you think something’s missing — hidden files exist!
- If a folder doesn’t unlock, check for typos or spaces in your password.

🎓 OBJECTIVES
By the end, you’ll have practiced:
- Navigating directories
- Reading and editing text files
- Running shell scripts
- Discovering hidden files
- Thinking critically like a digital detective 🕵️‍♀️
