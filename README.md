# The Case of the Missing Joel: Cat-astrophic Edition 🐾

Welcome, Detectives. Joel didn't just vanish — he was **swarmed by kittens** mid-refactor.
Your mission is to use your **terminal skills** to uncover who unleashed the cats and
deleted Joel’s work.

This activity is supports **macOS + Windows** and hads 3 checkpoints.

---

## Getting Started
- **macOS / Linux:** Open Terminal, `cd` into this folder.
- **Windows:** Open PowerShell, `cd` into this folder (Git Bash also works).

To list files: `ls`  •  Show hidden: `ls -a`  •  See where you are: `pwd`

---

## Checkpoints (Group Discussion)

### ✅ Checkpoint 1 — *The Scene of the Cat Crime*
**Goal:** Learn `cd`, `ls`, `cat`, and discover parent directories with `cd ..`.

1. `cd joel`
2. `ls` then `cat message.log`
3. Notice the phrase **“look above”** → `cd ..`

**Discuss:** What is a **parent directory**? How do we move “up”?

---

### ✅ Checkpoint 2 — *Hidden Paw-Prints*
**Goal:** Reveal hidden files, read backups, and search logs.

1. From the project root, run `ls -a` and `cd .hidden`
2. `cat backup_joel.txt`
3. Search logs for suspicious activity:
   - macOS/Linux: `grep "sudo" logs/system.log`
   - Windows: `Select-String -Pattern "sudo" -Path logs/system.log`

**Discuss:** Which commands revealed **hidden evidence**?

---

### ✅ Checkpoint 3 — *The Cat’s Out of the Bag*
**Goal:** Decode, inspect metadata, and trigger the reveal.

1. Decode Khalil’s alibi:
   - macOS/Linux: `base64 -d suspects/khalil/alibi.b64`
   - Windows (PowerShell): 
     ```powershell
     [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((Get-Content suspects/khalil/alibi.b64)))
     ```
2. Check Ana’s timestamps:
   - macOS/Linux: `stat suspects/ana/commit.txt`
   - Windows: `Get-Item suspects/ana/commit.txt | fl *`
3. Accuse the culprit (Hector) with the **final reveal**:
   - macOS/Linux (bash): `chmod +x final_hint.sh && ./final_hint.sh hector`
   - Windows (PowerShell): `powershell -ExecutionPolicy Bypass -File .\final_hint.ps1 hector`

**Celebrate:** Audio + popup confirm the solution. 🐈‍⬛

