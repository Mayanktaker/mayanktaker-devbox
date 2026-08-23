# 🟢 Mayanktaker Devbox

> **Skeptic-audited, production-grade Docker sandbox** for running 20+ AI coding agents, full-stack development tools, and mobile development (Flutter/Android) — all safely isolated from your host machine. Includes an **Interactive Setup Wizard** to enable or disable any component on demand!

**© [Mayanktaker Computers & Web Development](https://mayanktaker.com)**

---

## 🛡️ Why This Exists

After a [real incident on r/kilocode](https://www.reddit.com/r/kilocode/) where an AI agent ran `rm -rf /` and **wiped a user's entire system**, this sandbox was created to:

- **Isolate AI agents** in a Docker container so they **cannot touch your host OS**
- **Persist all your work** (code, extensions, SSH keys, DB data) across container restarts
- **Customize with ease**: Run `./manage.sh wizard` anytime to install everything or toggle only the modules you need!

If an AI goes rogue inside this sandbox, you just `./manage.sh down && ./manage.sh up`. Your host machine stays completely safe.

---

## 🧙‍♂️ Interactive Setup Wizard

Run `./manage.sh wizard` anytime to choose what to install/enable:

- **🚀 Install All (Full Supercharged Suite)** — Enable everything in one click!
- **🎛️ Custom Selection** — Interactively toggle:
  - [x] **AI Agent CLIs** (Claude, Kilo, Gemini, Antigravity, Devin, Aider, etc.)
  - [x] **Mobile Development** (Flutter SDK, Dart, Android SDK API 35)
  - [x] **Browser Testing & Automation** (Chromium, Playwright)
  - [x] **PHP 8.5 & Composer Ecosystem**
  - [x] **MySQL 8.4 Database Container + phpMyAdmin**
  - [x] **Redis 8 Cache Container + Redis Commander**
  - [x] **Firebase CLI & Local Emulator Suite**
  - [x] **Developer Productivity TUI Tools** (lazygit, lazydocker, bat, eza, fd, ripgrep)
- **⚡ Minimal Suite** — Ultra lightweight (VS Code Web + Node 24 + SQLite)

---

## ⚡ Quick Start

```bash
# 1. Clone and enter the project
git clone https://github.com/Mayanktaker/mayanktaker-devbox.git
cd mayanktaker-devbox

# 2. Run the Interactive Setup Wizard to select components
./manage.sh wizard

# 3. Start Devbox web services
./manage.sh up

# 4. Access VS Code in your browser
# → http://localhost:8085
```

---

## 🖥️ System Requirements

| Component | Minimum | This Sandbox Config |
| :--- | :--- | :--- |
| **CPU** | 4 cores | 10 threads (Ryzen 5 5500) |
| **RAM** | 16GB host | 25GB allocated (48GB host) |
| **Disk** | 20GB free | ~12-15GB image size (full mode) |
| **Docker** | v24+ | Docker Compose v2+ |
| **GPU** | Not required | RX 570 4GB (optional, for local LLMs) |

---

## 🧰 What's Included

### Base OS & Runtimes

| Component | Version | Notes |
| :--- | :--- | :--- |
| **Ubuntu** | **26.04 LTS** "Resolute Raccoon" | Latest LTS (April 2026) |
| **Node.js** | **24 LTS** | Active LTS (Aug 2026) |
| **PHP** | **8.5** | Latest stable (8.5.9) |
| **Python** | **3.12+** | System Python |
| **Java** | **21 JDK** | LTS (for Firebase Emulators, Android/Gradle) |
| **Bun** | Latest | Fast JS runtime & package manager |
| **Flutter** | **Stable** | Full SDK with Dart |
| **Android SDK** | **API 35** | cmdline-tools, platform-tools, build-tools 35 |

### 🤖 AI Coding Agent CLIs (20+)

| Agent | Install Source | Use Case |
| :--- | :--- | :--- |
| **Claude Code** | `@anthropic-ai/claude-code` | Deep reasoning, multi-file refactoring |
| **Kilo Code** | `@kilocode/cli` | Multi-surface agent (IDE + CLI + Cloud) |
| **Codex CLI** | `@openai/codex` | Sandboxed OpenAI code execution |
| **Cursor CLI** | `@cursor/cli` | AI pair programming |
| **Gemini CLI** | `@google/gemini-cli` | Google's terminal AI agent |
| **Antigravity CLI** | Official installer | Google's agentic dev platform |
| **Devin CLI** | `devin-cli` (pip) | Cognition's autonomous agent |
| **Aider** | `aider-chat` (pip) | Git-integrated terminal AI |
| **CommandCode** | `@commandcode/cli` | Terminal coding assistant |
| **OpenChamber** | `openchamber-cli` | Open-source agent |
| **Pi Agent** | `pi-agent` | Conversational AI coding |
| **Hermes Agent** | `hermes-agent` | Multi-model agent |
| **Paseo CLI** | `paseo-cli` | AI coding assistant |
| **Zcode** | `zcode` | Z.ai terminal agent |
| **T3code** | `t3code` | T3 Nightly coding CLI |
| **DeepSeek Harness** | `lm-eval` + `transformers` | Model evaluation framework |

### 🌐 Web Dashboards & Services

| Service | URL | Purpose |
| :--- | :--- | :--- |
| **VS Code Web** | `http://localhost:8085` | Full VS Code in browser with persistent extensions |
| **noVNC GUI** | `http://localhost:6080` | View desktop/Electron apps in browser |
| **phpMyAdmin** | `http://localhost:8086` | Visual MySQL database management |
| **Redis Commander** | `http://localhost:8087` | Visual Redis cache management |
| **Firebase UI** | `http://localhost:4000` | Firebase Local Emulator Suite |

### 🗄️ Databases & Cache

| Service | Image | Port |
| :--- | :--- | :--- |
| **MySQL** | `mysql:8.4` (LTS) | `3306` |
| **Redis** | `redis:8-alpine` | `6379` |
| **SQLite3** | Built-in | N/A |

### 🧪 Browser Testing & Automation

| Tool | Purpose |
| :--- | :--- |
| **Chromium** | Headless browser for testing |
| **Playwright** | Browser automation framework (Chromium pre-installed) |
| **Xvfb + x11vnc** | Virtual X11 display for GUI apps |

---

## 🔒 Persistence — Your Data Survives Container Restarts

| What's Persisted | Docker Volume | Purpose |
| :--- | :--- | :--- |
| Project source code | `./workspace` (bind mount) | Your repos and code |
| User home directory | `agent_home` | `.bashrc`, `.gitconfig`, dotfiles |
| SSH keys | `agent_ssh` | GitHub auth, server keys |
| VS Code settings | `vscode_data` | Keybindings, user settings |
| VS Code extensions | `vscode_extensions` | All installed extensions |
| Firebase credentials | `firebase_config` | Firebase CLI login token |
| npm/pnpm/Bun cache | `npm_cache` | Package download cache |
| Python/pip/UV cache | `pip_cache` | Package download cache |
| Composer cache | `composer_cache` | PHP package cache |
| MySQL database | `mysql_data` | All database tables & records |
| Redis cache | `redis_data` | AOF persistent cache data |
| Android/Gradle cache | `android_cache` | SDK downloads, Gradle builds |

---

## 📋 All Commands

```bash
./manage.sh wizard         # Run Interactive Customization Wizard
./manage.sh build          # Build the Docker image with current settings
./manage.sh up             # Start all enabled services
./manage.sh down           # Stop all services (data persisted)
./manage.sh restart        # Restart all services gracefully
./manage.sh shell          # Enter container terminal
./manage.sh update         # Update all AI tools, Flutter, npm & pip packages
./manage.sh code           # Show VS Code Web URL
./manage.sh gui            # Show noVNC GUI URL
./manage.sh pma            # Show phpMyAdmin URL
./manage.sh redis-ui       # Show Redis Commander URL
./manage.sh firebase       # Show Firebase Emulator UI URL
./manage.sh db             # Open MySQL CLI
./manage.sh redis          # Open Redis CLI
./manage.sh backup         # Database dump to ./backups/
./manage.sh auto-backup    # Setup daily 2:00 AM cron backup
./manage.sh health         # Check service healthchecks
./manage.sh clean          # Prune Docker build caches
./manage.sh status         # Container status + resource usage
./manage.sh logs           # Tail container logs
./manage.sh flutter-doctor # Run Flutter diagnostics
```

---

## 🔑 Environment Variables

Copy `.env.example` to `.env` and fill in your API keys:

```bash
cp .env.example .env
```

| Variable | Required? | Purpose |
| :--- | :--- | :--- |
| `OPENAI_API_KEY` | Optional | For Codex CLI, GPT models |
| `ANTHROPIC_API_KEY` | Optional | For Claude Code |
| `GEMINI_API_KEY` | Optional | For Gemini CLI, Antigravity |
| `DEVIN_API_KEY` | Optional | For Devin CLI |
| `KIMI_API_KEY` | Optional | For Kimi Code |

---

## 🛡️ Security Features

- **Non-root user**: Container runs as `agent` (UID 1000), not root
- **no-new-privileges**: Prevents privilege escalation attacks
- **Healthchecks**: MySQL, Redis, and code-server monitored automatically
- **Log rotation**: JSON file logging with 50MB rotation (prevents disk fill)
- **Host isolation**: If an AI agent runs `rm -rf /`, only the container is affected

---

## 📝 License

MIT License — Use freely, modify freely.

**Built with ❤️ by [Mayanktaker](https://mayanktaker.com)**
