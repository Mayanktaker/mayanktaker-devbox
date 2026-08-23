# 🟢 Mayanktaker Devbox

> **Skeptic-audited, production-grade Docker sandbox** for running 20+ AI coding agents, full-stack development tools, and mobile development (Flutter/Android/React Native Expo/Fastlane) — all safely isolated from your host machine. Includes an **Interactive Setup Wizard** to customize stack runtimes (Node, PHP, Java, Rust, Go, Bun, uv, Deno, C/C++), shell choices (Bash, Zsh, Fish), terminal editors (Neovim/Vim, Micro, Helix), and database containers (MySQL, MariaDB, Postgres, Mongo, Redis, KeyDB) with a **Host Permissions Pre-Check & Auto-Fix System**!

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

## 🔒 Permissions & Docker Group Pre-Check System

To ensure users never run into `Permission denied` errors or Docker daemon access issues on Linux, Mayanktaker Devbox includes an automated pre-check:

- **Automated Check**: `./manage.sh build` and `./manage.sh up` automatically run host directory & Docker group pre-checks before executing.
- **Manual Pre-Check**: Run `./manage.sh fix-perms` anytime or select **Option `[8] 🔒 Run Host Permissions Pre-Check`** in the setup wizard.
- **Auto-Fixes**:
  - Automatically verifies & sets `chmod 775` on host `./workspace`, `./devbox_config`, and `./backups` directories.
  - Automatically prompts & adds your Linux host user to the `docker` group (`sudo usermod -aG docker $USER`).

---

## 🧙‍♂️ Interactive Setup Wizard & Stack Choice

Run `./manage.sh wizard` anytime to configure your devbox:

- **🚀 Install All (Full Supercharged Suite)** — Enable everything!
- **⚡ Minimal Suite** — Ultra-lightweight core setup (AI Agents + Node 24 + Expo + Bun + UV + Zsh + Neovim + VS Code Web)
- **🎛️ Custom Component Toggles**:
  - [x] **AI Agent CLIs** (Claude, Kilo, Gemini, Antigravity, Devin, Aider, etc.)
  - [x] **Mobile Development (Flutter SDK, Dart, Android SDK API 35)**
  - [x] **React Native Expo CLI & eas-cli (Cloud iOS/Android Builds)**
  - [x] **Fastlane Mobile Release Automation**
  - [x] **Kotlin Compiler (`kotlinc`)**
  - [x] **Watchman React Native Hot Reload**
  - [x] **Browser Testing & Automation (Chromium, Playwright)**
  - [x] **Lighthouse Core Web Vitals & PWA Audit CLI**
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

## 💻 Desktop Apps vs Web IDE & CLI Tools

Mayanktaker Devbox comes pre-configured with **VS Code Web (`code-server`)** at `http://localhost:8085` and **noVNC Desktop Viewer** at `http://localhost:6080`.

- **GUI / Desktop App Support**: Desktop GUI apps (Chromium, Electron apps, Linux desktop viewers) run via Xvfb + noVNC in your browser at `http://localhost:6080`.
- **CLI Agents & Tooling**: 20+ AI CLI tools (`claude`, `kilo`, `codex`, `cursor`, `devin`, `gemini`, `antigravity`) run natively inside the sandboxed container shell.
- **Native Host IDEs**: If you prefer native host desktop IDEs (like Cursor Desktop or VS Code Desktop), you can use the **Remote - Containers / SSH** extension to connect directly to `mayanktaker-devbox`.

---

## 🧰 What's Included

### Base OS, Runtimes & Mobile SDKs

| Component | Recommended Default | Alternative Choice | Notes |
| :--- | :--- | :--- | :--- |
| **Ubuntu** | **26.04 LTS** "Resolute Raccoon" | — | Latest LTS (April 2026) |
| **Node.js** | **24 LTS** ⭐ | Node 26 Current | Active LTS (Aug 2026) |
| **Flutter SDK** | **Installed** ⭐ | Optional | Full SDK + Dart |
| **Android SDK** | **API 35** ⭐ | Optional | cmdline-tools, platform-tools, build-tools |
| **React Native Expo** | **Installed** ⭐ | Optional | `expo-cli` & `eas-cli` (Cloud iOS Builds) |
| **Fastlane** | **Installed** ⭐ | Optional | Automated App Store & Play Store releases |
| **Kotlin Compiler** | **Installed** ⭐ | Optional | Native Android Kotlin development |
| **Lighthouse CLI** | **Installed** ⭐ | Optional | Web Vitals & PWA Performance Audits |
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

## 🔒 Persistent Directory & Volume Inventory

All data, settings, extensions, and database records survive container restarts and rebuilds through these persistent mounts:

| Host / Docker Volume | Container Mount Path | Persisted Items |
| :--- | :--- | :--- |
| **`./workspace`** (bind mount) | `/workspace` | Project source code & repository files |
| **`./devbox_config`** (bind mount) | `/home/agent/.kilo` | Agent configurations & profiles |
| **`agent_home`** (volume) | `/home/agent` | `.bashrc`, `.zshrc`, `.gitconfig`, dotfiles |
| **`agent_ssh`** (volume) | `/home/agent/.ssh` | SSH keypairs & known_hosts |
| **`vscode_data`** (volume) | `/home/agent/.config/code-server` | VS Code Web user settings & keybindings |
| **`vscode_extensions`** (volume) | `/home/agent/.local/share/code-server` | All installed VS Code Web extensions |
| **`firebase_config`** (volume) | `/home/agent/.config/configstore` | Firebase CLI login token & state |
| **`npm_cache`** (volume) | `/home/agent/.npm` | Global npm / pnpm / Bun download cache |
| **`pip_cache`** (volume) | `/home/agent/.cache` | Python pip / UV package download cache |
| **`composer_cache`** (volume) | `/home/agent/.cache/composer` | PHP Composer package download cache |
| **`mysql_data`** (volume) | `/var/lib/mysql` | MySQL 8.4 / MariaDB database tables & schemas |
| **`postgres_data`** (volume) | `/var/lib/postgresql/data` | PostgreSQL 17 database files |
| **`pgadmin_data`** (volume) | `/var/lib/pgadmin` | pgAdmin 4 user configurations & saved servers |
| **`mongo_data`** (volume) | `/data/db` | MongoDB 8 document database storage |
| **`redis_data`** (volume) | `/data` | Redis 8 / KeyDB AOF persistent cache data |
| **`android_cache`** (volume) | `/home/agent/.android` | Android SDK licenses, AVDs & Gradle build cache |

---

## 📋 All Commands

```bash
./manage.sh wizard         # Run Interactive Customization Wizard
./manage.sh fix-perms      # Run Host Permissions & Docker Group Pre-Check
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
