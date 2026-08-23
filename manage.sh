#!/usr/bin/env bash
# © Mayanktaker Computers & Web Development | https://mayanktaker.com
# Ultimate Management Script for Mayanktaker Devbox (Ubuntu 26.04 LTS)
# Skeptic-audited August 2026

set -e

# Terminal color codes
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print header banner
show_banner() {
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${GREEN}  🟢 Mayanktaker Devbox (Ubuntu 26.04 LTS)          ${NC}"
    echo -e "${CYAN}  © Mayanktaker Computers & Web Development         ${NC}"
    echo -e "${CYAN}====================================================${NC}"
}

# Ensure .env exists
check_env() {
    if [ ! -f ".env" ]; then
        echo -e "${YELLOW}[!] .env file missing. Copying from .env.example...${NC}"
        cp .env.example .env
    fi
}

# Host Permissions & Wayland/Display Pre-Check Helper
check_permissions() {
    echo -e "${CYAN}[+] Running Host Permissions & Display Pre-Check...${NC}"
    
    # 1. Ensure required host folders exist
    mkdir -p workspace devbox_config backups
    chmod -R 775 workspace devbox_config backups 2>/dev/null || true
    
    # 2. Check if current user is in docker group
    if command -v docker >/dev/null 2>&1; then
        if ! groups "$USER" 2>/dev/null | grep -q "\bdocker\b"; then
            echo -e "${YELLOW}[!] User '$USER' is not in the 'docker' group.${NC}"
            echo -e "${CYAN}    To fix: sudo usermod -aG docker $USER${NC}"
        else
            echo -e "${GREEN}  ✓ Docker group membership OK${NC}"
        fi
    fi

    # 3. Check workspace directory ownership & permissions
    if [ ! -w "workspace" ]; then
        echo -e "${YELLOW}[!] Host 'workspace' directory is not writable by $USER. Fixing permissions...${NC}"
        chmod -R 775 workspace devbox_config backups 2>/dev/null || true
    else
        echo -e "${GREEN}  ✓ Host workspace directory permissions OK${NC}"
    fi

    # 4. Check Wayland / X11 Host Display Status
    if [ -n "$WAYLAND_DISPLAY" ] || [ -e "/run/user/$UID/wayland-0" ]; then
        echo -e "${GREEN}  ✓ Linux Wayland Display detected (${WAYLAND_DISPLAY:-wayland-0}) — Weston & XWayland forwarding active!${NC}"
    elif [ -n "$DISPLAY" ]; then
        echo -e "${GREEN}  ✓ Linux X11 Display detected ($DISPLAY) — X11 forwarding active!${NC}"
    else
        echo -e "${CYAN}  ℹ Headless mode / noVNC web browser desktop active (http://localhost:6080)${NC}"
    fi
}

# Main command router
case "$1" in
    wizard|setup|config)
        bash ./wizard.sh
        ;;
    fix-perms|perms)
        show_banner
        check_permissions
        echo -e "${GREEN}[✓] Host permissions pre-check complete!${NC}"
        ;;
    keys)
        show_banner
        check_env
        echo -e "${GREEN}[+] Current API Keys Status in .env:${NC}"
        echo ""
        source .env 2>/dev/null || true
        print_key_status() {
            local name="$1"
            eval "local val=\$$name"
            if [ -n "$val" ]; then
                echo -e "  - ${name}: ${GREEN}[✓ Configured] (${val:0:6}...)${NC}"
            else
                echo -e "  - ${name}: ${YELLOW}[✗ Not set]${NC}"
            fi
        }
        print_key_status "OPENAI_API_KEY"
        print_key_status "ANTHROPIC_API_KEY"
        print_key_status "GEMINI_API_KEY"
        print_key_status "OPENROUTER_API_KEY"
        print_key_status "KILO_API_KEY"
        print_key_status "OPENCODE_API_KEY"
        print_key_status "DEVIN_API_KEY"
        print_key_status "KIMI_API_KEY"
        print_key_status "CURSOR_API_KEY"
        print_key_status "DEEPSEEK_API_KEY"
        print_key_status "MISTRAL_API_KEY"
        print_key_status "GITHUB_TOKEN"
        echo ""
        read -p "Would you like to configure/update these keys now? (y/N): " edit_keys
        case "$edit_keys" in
            [yY]*)
                bash ./wizard.sh
                ;;
        esac
        ;;
    build)
        show_banner
        check_env
        check_permissions
        echo -e "${GREEN}[+] Building Devbox Docker image (Ubuntu 26.04)...${NC}"
        docker compose build devbox
        ;;
    up)
        show_banner
        check_env
        check_permissions
        echo -e "${GREEN}[+] Starting Devbox services (25GB RAM, 10 CPUs)...${NC}"
        docker compose up -d
        echo -e "${GREEN}[✓] All Devbox Web Services Running!${NC}"
        echo -e "${CYAN}    - VS Code Web (MS) : http://localhost:8085${NC}"
        echo -e "${CYAN}    - VSCodium Web     : http://localhost:8084 (Open-VSX Telemetry-Free)${NC}"
        echo -e "${CYAN}    - noVNC GUI Web   : http://localhost:6080${NC}"
        echo -e "${CYAN}    - phpMyAdmin      : http://localhost:8086${NC}"
        echo -e "${CYAN}    - Redis Commander : http://localhost:8087${NC}"
        echo -e "${CYAN}    - pgAdmin 4 UI    : http://localhost:8088${NC}"
        echo -e "${CYAN}    - Mongo Express UI: http://localhost:8089${NC}"
        echo -e "${CYAN}    - Firebase UI     : http://localhost:4000${NC}"
        echo -e "${CYAN}    - Agent Server    : http://localhost:8081${NC}"
        ;;
    down)
        show_banner
        echo -e "${YELLOW}[-] Stopping Devbox containers...${NC}"
        docker compose down
        echo -e "${GREEN}[✓] Stopped. All settings, extensions & DB data remain persisted.${NC}"
        ;;
    restart)
        show_banner
        echo -e "${YELLOW}[-] Restarting all services gracefully...${NC}"
        docker compose down
        docker compose up -d
        echo -e "${GREEN}[✓] All services restarted!${NC}"
        ;;
    shell)
        show_banner
        echo -e "${GREEN}[+] Opening interactive shell inside Devbox...${NC}"
        docker compose exec devbox bash
        ;;
    update)
        show_banner
        echo -e "${GREEN}[+] Updating all AI CLI tools, Flutter, npm packages...${NC}"
        docker compose exec devbox sudo /usr/local/bin/update-tools
        echo -e "${GREEN}[✓] All tools updated!${NC}"
        ;;
    code)
        show_banner
        echo -e "${GREEN}[+] VS Code Web Server (Microsoft):${NC}"
        echo -e "${CYAN}    👉 http://localhost:8085${NC}"
        ;;
    vscodium|codium)
        show_banner
        echo -e "${GREEN}[+] VSCodium Web Server (Open-VSX Telemetry-Free):${NC}"
        echo -e "${CYAN}    👉 http://localhost:8084${NC}"
        ;;
    gui)
        show_banner
        echo -e "${GREEN}[+] noVNC Web Browser GUI Viewer:${NC}"
        echo -e "${CYAN}    👉 http://localhost:6080${NC}"
        ;;
    pma)
        show_banner
        echo -e "${GREEN}[+] phpMyAdmin Visual MySQL Dashboard:${NC}"
        echo -e "${CYAN}    👉 http://localhost:8086${NC}"
        ;;
    redis-ui)
        show_banner
        echo -e "${GREEN}[+] Redis Commander Visual Web UI:${NC}"
        echo -e "${CYAN}    👉 http://localhost:8087${NC}"
        ;;
    pgadmin)
        show_banner
        echo -e "${GREEN}[+] pgAdmin 4 Visual PostgreSQL Dashboard:${NC}"
        echo -e "${CYAN}    👉 http://localhost:8088${NC}"
        ;;
    mongo-ui)
        show_banner
        echo -e "${GREEN}[+] Mongo Express Visual MongoDB Dashboard:${NC}"
        echo -e "${CYAN}    👉 http://localhost:8089${NC}"
        ;;
    firebase|emulators)
        show_banner
        echo -e "${GREEN}[+] Firebase Local Emulator Suite UI:${NC}"
        echo -e "${CYAN}    👉 http://localhost:4000${NC}"
        ;;
    db)
        show_banner
        echo -e "${GREEN}[+] Connecting to MySQL Database...${NC}"
        docker compose exec mysql-db mysql -u root -psecret sandbox_db
        ;;
    pg)
        show_banner
        echo -e "${GREEN}[+] Connecting to PostgreSQL Database...${NC}"
        docker compose exec postgres-db psql -U postgres sandbox_db
        ;;
    mongo)
        show_banner
        echo -e "${GREEN}[+] Connecting to MongoDB Shell...${NC}"
        docker compose exec mongo-db mongosh -u root -p secret
        ;;
    redis)
        show_banner
        echo -e "${GREEN}[+] Connecting to Redis Cache CLI...${NC}"
        docker compose exec devbox redis-cli -h redis-cache
        ;;
    backup)
        show_banner
        echo -e "${GREEN}[+] Creating database backup...${NC}"
        mkdir -p ./backups
        docker compose exec mysql-db mysqldump -u root -psecret sandbox_db > ./backups/sandbox_db_$(date +%Y%m%d_%H%M%S).sql
        echo -e "${GREEN}[✓] Database backed up to ./backups/${NC}"
        ;;
    auto-backup)
        show_banner
        echo -e "${GREEN}[+] Setting up daily 2:00 AM automatic backup...${NC}"
        mkdir -p ./backups
        CRON_SCRIPT="$(pwd)/manage.sh backup > /dev/null 2>&1"
        (crontab -l 2>/dev/null | grep -v "manage.sh backup" ; echo "0 2 * * * $CRON_SCRIPT") | crontab -
        echo -e "${GREEN}[✓] Daily automated backup configured!${NC}"
        ;;
    health)
        show_banner
        echo -e "${CYAN}[i] Running healthchecks on all services...${NC}"
        docker compose ps --format "table {{.Name}}\t{{.Status}}\t{{.Ports}}"
        echo ""
        echo -e "${CYAN}[i] Individual service health:${NC}"
        for svc in devbox mysql-db redis-cache postgres-db mongo-db; do
            STATUS=$(docker inspect --format='{{.State.Health.Status}}' $svc 2>/dev/null || echo "not running / no healthcheck")
            echo -e "    ${svc}: ${STATUS}"
        done
        ;;
    clean)
        show_banner
        echo -e "${YELLOW}[-] Pruning unused Docker build caches & dangling images...${NC}"
        docker system prune -f
        docker image prune -f
        echo -e "${GREEN}[✓] Clean completed.${NC}"
        ;;
    status)
        show_banner
        echo -e "${CYAN}[i] Container Status & Resource Usage:${NC}"
        docker compose ps
        echo ""
        docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" 2>/dev/null || true
        ;;
    logs)
        show_banner
        echo -e "${CYAN}[i] Tailing container logs...${NC}"
        docker compose logs -f --tail=100
        ;;
    flutter-doctor)
        show_banner
        echo -e "${GREEN}[+] Running Flutter doctor inside Devbox...${NC}"
        docker compose exec devbox /opt/flutter/bin/flutter doctor -v
        ;;
    *)
        show_banner
        echo -e "${YELLOW}Usage: ./manage.sh [command]${NC}"
        echo ""
        echo "Commands:"
        echo "  wizard / setup Run Interactive Customization Wizard"
        echo "  fix-perms      Run Host Permissions & Display Pre-Check"
        echo "  keys           View or configure API keys (.env)"
        echo "  build          Build the Devbox Docker image"
        echo "  up             Start all enabled Devbox services"
        echo "  down           Stop Devbox services (data persisted)"
        echo "  restart        Restart all services gracefully"
        echo "  shell          Launch interactive terminal inside container"
        echo "  update         Update all AI CLI tools, Flutter, npm & pip packages"
        echo "  code           VS Code Web (MS) URL (http://localhost:8085)"
        echo "  vscodium       VSCodium Web (Open-VSX) URL (http://localhost:8084)"
        echo "  gui            noVNC GUI Viewer URL (http://localhost:6080)"
        echo "  pma            phpMyAdmin URL (http://localhost:8086)"
        echo "  redis-ui       Redis Commander URL (http://localhost:8087)"
        echo "  pgadmin        pgAdmin 4 PostgreSQL UI URL (http://localhost:8088)"
        echo "  mongo-ui       Mongo Express MongoDB UI URL (http://localhost:8089)"
        echo "  firebase       Firebase Emulator UI URL (http://localhost:4000)"
        echo "  db             Open MySQL database terminal"
        echo "  pg             Open PostgreSQL database terminal"
        echo "  mongo          Open MongoDB terminal"
        echo "  redis          Open Redis Cache CLI terminal"
        echo "  backup         Create database dump backup"
        echo "  auto-backup    Configure daily 2:00 AM cron backup"
        echo "  health         Run healthchecks on all services"
        echo "  clean          Prune Docker build caches & dangling images"
        echo "  status         Container status & resource usage"
        echo "  logs           Tail container logs"
        echo "  flutter-doctor Run Flutter doctor diagnostics"
        echo ""
        ;;
esac
