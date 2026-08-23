# 🟢 Mayanktaker Devbox

> **Skeptic-audited, production-grade Docker sandbox** for running 20+ AI coding agents, full-stack development tools, and mobile development (Flutter/Android) — all safely isolated from your host machine. Includes an **Interactive Setup Wizard** to customize stack runtimes (Node, PHP, Java, Rust, Go, Bun, uv, Deno, C/C++), shell choices (Bash, Zsh, Fish), terminal editors (Neovim/Vim, Micro, Helix), and database containers (MySQL, MariaDB, Postgres, Mongo, Redis, KeyDB)!

**© [Mayanktaker Computers & Web Development](https://mayanktaker.com)**

---

## 🛡️ Why This Exists

After a [real incident on r/kilocode](https://www.reddit.com/r/kilocode/) where an AI agent ran `rm -rf /` and **wiped a user's entire system**, this sandbox was created to:

- **Isolate AI agents** in a Docker container so they **cannot touch your host OS**
- **Persist all your work** (code, extensions, SSH keys, DB data) across container restarts
- **Customize with ease**: Run `./manage.sh wizard` anytime to install everything, toggle modules, or switch stack versions!

If an AI goes rogue inside this sandbox, you just `./manage.sh down && ./manage.sh up`. Your host machine stays completely safe.

---

## 🙏 Special Thanks & Acknowledgments

Special thanks to Reddit user **[u/kaas_is_leven](https://www.reddit.com/r/kilocode/comments/1vnytts/comment/p5dsj9w/)** on [r/kilocode](https://www.reddit.com/r/kilocode/) for inspiring this project! Their original suggestion on using Docker containerization to safely isolate AI coding agents laid the foundation for building this ultimate, supercharged multi-agent devbox environment.

---

## 🧙‍♂️ Interactive Setup Wizard & Stack Choice

Run `./manage.sh wizard` anytime to configure your devbox:

- **🚀 Install All (Full Supercharged Suite)** — Enable everything!
- **⚡ Minimal Suite** — Ultra-lightweight core setup (AI Agents + Node 24 + Bun + UV + Zsh + Neovim + VS Code Web)
- **🎛️ Custom Component Toggles**:
  - [x] **AI Agent CLIs** (Claude, Kilo, Gemini, Antigravity, Devin, Aider, etc.)
  - [x] **Mobile Development** (Flutter SDK, Dart, Android SDK API 35)
  - [x] **Browser Testing & Automation** (Chromium, Playwright)
  - [x] **PHP & Composer Ecosystem**
  - [x] **Bun JS/TS Runtime & Fast Package Manager**
  - [x] **uv Python Package Manager & Resolver**
  - [x] **Rust Toolchain (rustup, cargo, rustc)**
  - [ ] **Go Language (Golang 1.23)**
  - [ ] **Deno TS/JS Runtime**
  - [ ] **C/C++ Modern Toolchain (Clang 18, LLVM 18, CMake, Ninja, GDB)**
  - [x] **Zsh Shell + Starship Prompt**
  - [ ] **Fish Shell**
  - [x] **Neovim & Vim Terminal Editor**
  - [x] **Micro Terminal Text Editor**
  - [ ] **Helix Modal Editor**
  - [x] **Web & Frontend Scaffolding CLIs (Astro, Next.js, Vite, Tailwind CLI)**
  - [x] **MySQL 8.4 / MariaDB 11.4 Container + phpMyAdmin**
  - [ ] **PostgreSQL 17 Container + pgAdmin 4 UI**
  - [ ] **MongoDB 8 Container + Mongo Express UI**
  - [x] **Redis 8 / KeyDB Cache Container + Redis Commander**
  - [x] **Firebase CLI & Local Emulator Suite**
  - [x] **Developer Productivity TUI Tools** (lazygit, lazydocker, bat, eza, fd, ripgrep)
- **🔑 API Keys Configuration Helper** — Easily set API keys for OpenAI, Anthropic, Gemini, OpenRouter, Kilo, OpenCode, Devin, Kimi, Cursor, DeepSeek, Mistral.

---

## ⚡ Quick Start

```bash
# 1. Clone and enter the project
git clone https://github.com/Mayanktaker/mayanktaker-devbox.git
cd mayanktaker-devbox

# 2. Run the Interactive Setup Wizard to select components & API keys
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

### Base OS, Runtimes & Compilers

| Component | Recommended Default | Alternative Choice | Notes |
| :--- | :--- | :--- | :--- |
| **Ubuntu** | **26.04 LTS** "Resolute Raccoon" | — | Latest LTS (April 2026) |
| **Node.js** | **24 LTS** ⭐ | Node 26 Current | Active LTS (Aug 2026) |
| **PHP** | **8.5** ⭐ | PHP 8.4 | Latest stable (8.5.9) |
| **Composer** | **Installed** ⭐ | Optional | PHP Package Manager |
| **Bun** | **Installed** ⭐ | Optional | Fast JS/TS Runtime & PM |
| **uv** | **Installed** ⭐ | Optional | Fast Python Package Resolver |
| **Rust** | **Installed** ⭐ | Optional | rustup, cargo, rustc |
| **Go (Golang)** | **Optional** | Installed | Go 1.23+ compiled language |
| **Deno** | **Optional** | Installed | Deno TS/JS runtime |
| **C/C++ Toolchain** | **Optional** | Installed | Clang 18, LLVM 18, CMake, Ninja |
| **Java** | **21 JDK** ⭐ | Java 17 JDK | Current LTS |
| **Shells** | **Zsh + Starship** ⭐ | Bash, Fish | Command shell choice |
| **Editors** | **VS Code Web, Neovim, Micro** ⭐ | Helix | Terminal IDEs & Editors |

### 🗄️ Database & Caching Services

| Service | Container Image | Port | Web Management GUI |
| :--- | :--- | :--- | :--- |
| **Relational DB** | MySQL 8.4 LTS ⭐ / MariaDB 11.4 | `3306` | phpMyAdmin (`http://localhost:8086`) |
| **PostgreSQL DB** | PostgreSQL 17 | `5432` | pgAdmin 4 (`http://localhost:8088`) |
| **MongoDB** | MongoDB 8.0 | `27017` | Mongo Express (`http://localhost:8089`) |
| **Cache Engine** | Redis 8 Alpine ⭐ / KeyDB | `6379` | Redis Commander (`http://localhost:8087`) |

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
| **phpMyAdmin** | `http://localhost:8086` | Visual MySQL / MariaDB database management |
| **Redis Commander** | `http://localhost:8087` | Visual Redis / KeyDB cache management |
| **pgAdmin 4 UI** | `http://localhost:8088` | Visual PostgreSQL database management |
| **Mongo Express UI** | `http://localhost:8089` | Visual MongoDB database management |
| **Firebase UI** | `http://localhost:4000` | Firebase Local Emulator Suite |

---

## 🔒 Persistence — Your Data Survives Container Restarts

| What's Persisted | Docker Volume | Purpose |
| :--- | :--- | :--- |
| Project source code | `./workspace` (bind mount) | Your repos and code |
| User home directory | `agent_home` | `.bashrc`, `.zshrc`, dotfiles |
| SSH keys | `agent_ssh` | GitHub auth, server keys |
| VS Code settings | `vscode_data` | Keybindings, user settings |
| VS Code extensions | `vscode_extensions` | All installed extensions |
| Firebase credentials | `firebase_config` | Firebase CLI login token |
| npm/pnpm/Bun cache | `npm_cache` | Package download cache |
| Python/pip/UV cache | `pip_cache` | Package download cache |
| Composer cache | `composer_cache` | PHP package cache |
| MySQL / MariaDB database | `mysql_data` | All database tables & records |
| PostgreSQL database | `postgres_data` | Postgres database storage |
| pgAdmin settings | `pgadmin_data` | pgAdmin configuration & servers |
| MongoDB database | `mongo_data` | Mongo database documents |
| Redis / KeyDB cache | `redis_data` | AOF persistent cache data |
| Android/Gradle cache | `android_cache` | SDK downloads, Gradle builds |

---

## 📋 All Commands

```bash
./manage.sh wizard         # Run Interactive Customization Wizard
./manage.sh keys           # View or configure API keys (.env)
./manage.sh build          # Build the Devbox Docker image with current settings
./manage.sh up             # Start all enabled services
./manage.sh down           # Stop all services (data persisted)
./manage.sh restart        # Restart all services gracefully
./manage.sh shell          # Enter container terminal
./manage.sh update         # Update all AI tools, Flutter, npm & pip packages
./manage.sh code           # Show VS Code Web URL
./manage.sh gui            # Show noVNC GUI URL
./manage.sh pma            # Show phpMyAdmin URL
./manage.sh redis-ui       # Show Redis Commander URL
./manage.sh pgadmin        # Show pgAdmin 4 PostgreSQL UI URL
./manage.sh mongo-ui       # Show Mongo Express MongoDB UI URL
./manage.sh firebase       # Show Firebase Emulator UI URL
./manage.sh db             # Open MySQL database terminal
./manage.sh pg             # Open PostgreSQL terminal
./manage.sh mongo          # Open MongoDB terminal
./manage.sh redis          # Open Redis Cache CLI terminal
./manage.sh backup         # Database dump to ./backups/
./manage.sh auto-backup    # Setup daily 2:00 AM cron backup
./manage.sh health         # Check service healthchecks
./manage.sh clean          # Prune Docker build caches
./manage.sh status         # Container status + resource usage
./manage.sh logs           # Tail container logs
./manage.sh flutter-doctor # Run Flutter diagnostics
```

---

## 📝 License

MIT License — Use freely, modify freely.

**Built with ❤️ by [Mayanktaker](https://mayanktaker.com)**
