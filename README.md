# VERNACAI — SIH Premium Localhost Prototype

## Fastest way to run
1. Extract this folder.
2. Open the folder.
3. Double-click `START_VERNACAI.bat`.
4. It installs dependencies and opens `http://localhost:5173`.

If Windows PowerShell blocks `npm.ps1`, use the BAT file above. It calls `npm.cmd`, which avoids the PowerShell execution-policy problem.

## Manual command-line method
Open **Command Prompt (cmd.exe)**, not PowerShell:

```text
cd /d "C:\path\to\VERNACAI_SIH_Prototype"
npm.cmd install
npm.cmd run dev
```

Then open:
`http://localhost:5173`

## Prototype scope
The UI is intentionally designed as a polished SIH demo prototype. Core interactions are functional locally:
- mother-tongue language selection
- multi-screen navigation with Back/Home/section navigation
- live text translation demo
- browser read-aloud using Web Speech API when supported
- AI subtitle timeline demo
- adaptive learning journey
- Past Perfect lesson + quiz
- pronunciation coach interaction
- real-time conversation/role-play demo
- image/OCR upload flow demo
- document translation flow demo
- AI story + guess-the-next-part activity
- culture/festival learning
- smart alerts + keyword watch demo
- profile/accent settings

AI/translation/OCR/subtitle results are demo logic unless you connect real APIs later. Do not claim external model inference is running when it is not.

## SIH demo path
Welcome → Language → Home → Live Translator → Unknown Finder → Learn → Past Perfect → Quiz → Pronunciation → Conversation → Scan → Story → Culture → Smart Alerts → Profile.

## UI direction
The visual system uses a dark, cinematic, premium AI-product aesthetic inspired by the reference screens: glass panels, restrained neon violet/cyan accents, soft bloom, thin borders, generous spacing, and a consistent workspace shell. The landing screen is the strongest marketing/hero treatment; internal pages remain product-focused and functional rather than looking like a landing-page clone.
