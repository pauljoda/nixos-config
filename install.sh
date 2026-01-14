#!/usr/bin/env bash

init() {
    # Vars
    CURRENT_USERNAME='paul'

    # Colors
    NORMAL=$(tput sgr0)
    WHITE=$(tput setaf 7)
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    BRIGHT=$(tput bold)
    UNDERLINE=$(tput smul)
}

confirm() {
    echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
    read -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 0
    fi
}

print_header() {
    echo -E "$CYAN

        _____            _ _           _                                    
        |  __ \\          | (_)         | |                                   
        | |__) |_ _ _   _| |_  ___   __| | __ _                              
        |  ___/ _\` | | | | | |/ _ \\ / _\` |/ _\` |                             
        | |  | (_| | |_| | | | (_) | (_| | (_| |                             
        |_|   \\__,_|\\__,_|_| |\\___/ \\__,_|\\__,_|                             
                        _/ |                                               
        _   _ _       __|__/ _____   _____           _        _ _           
        | \\ | (_)     / __ \\ / ____| |_   _|         | |      | | |          
        |  \\| |___  _| |  | | (___     | |  _ __  ___| |_ __ _| | | ___ _ __ 
        | . \` | \\ \\/ / |  | |\\___ \\    | | | '_ \\/ __| __/ _\` | | |/ _ \\ '__|
        | |\\  | |>  <| |__| |____) |  _| |_| | | \\__ \\ || (_| | | |  __/ |   
        |_| \\_|_/_/\\_\\\\____/|_____/  |_____|_| |_|___/\\__\\__,_|_|_|\\___|_|   

                        Based on Frost Pheonix's dotfiles                               
                                                                            

                $BLUE https://github.com/pauljoda/nixos-config $RED 
      ! To make sure everything runs correctly DONT run as root ! $GREEN
                        -> '"./install.sh"' $NORMAL

    "
}

get_username() {
    echo -en "Enter your$GREEN username$NORMAL : $YELLOW"
    read username
    echo -en "$NORMAL"
    echo -en "Use$YELLOW "$username"$NORMAL as ${GREEN}username${NORMAL} ? "
    confirm
}

set_username() {
    sed -i -e "s/${CURRENT_USERNAME}/${username}/g" ./flake.nix
    sed -i -e "s/${CURRENT_USERNAME}/${username}/g" ./modules/home/audacious/config
    sed -i -e "s/${CURRENT_USERNAME}/${username}/g" ./modules/home/ghostty.nix
}

get_host() {
    echo -en "Enter the ${GREEN}host name${NORMAL} (ex: ${YELLOW}macbook-air-2013${NORMAL}): "
    read -r HOST

    if [[ -z $HOST ]]; then
        echo "Host name cannot be empty."
        exit 1
    fi

    if [[ -d "hosts/${HOST}" ]]; then
        echo -en "Host ${YELLOW}${HOST}${NORMAL} already exists. Use existing host? "
        confirm
        return
    fi

    echo -en "Host ${YELLOW}${HOST}${NORMAL} does not exist. Create new host? "
    confirm
    mkdir -p "hosts/${HOST}"

    echo -en "Choose a ${GREEN}base template${NORMAL} - [${YELLOW}D${NORMAL}]esktop, [${YELLOW}L${NORMAL}]aptop or [${YELLOW}V${NORMAL}]irtual machine: "
    read -n 1 -r
    echo

    if [[ $REPLY =~ ^[Dd]$ ]]; then
        TEMPLATE='desktop'
    elif [[ $REPLY =~ ^[Ll]$ ]]; then
        TEMPLATE='laptop'
    elif [[ $REPLY =~ ^[Vv]$ ]]; then
        TEMPLATE='vm'
    else
        echo "Invalid choice. Please select 'D' for desktop, 'L' for laptop or 'V' for virtual machine."
        exit 1
    fi

    echo -en "Use the ${YELLOW}${TEMPLATE}${NORMAL} ${GREEN}template${NORMAL}? "
    confirm
    cp -r "hosts/${TEMPLATE}/." "hosts/${HOST}/"
    add_host_to_flake "${HOST}"
}

add_host_to_flake() {
    local host="$1"
    local flake_file="flake.nix"
    local block

    if rg -q "^[[:space:]]${host}[[:space:]]*= nixpkgs\\.lib\\.nixosSystem" "$flake_file"; then
        return
    fi

    block=$(cat <<EOF
      ${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/${host})];
        specialArgs = {
          host = "${host}";
          inherit self inputs username;
        };
      };
EOF
)

    awk -v block="$block" '
    function count(s, c,   n, i, ch) {
        n = 0
        for (i = 1; i <= length(s); i++) {
            ch = substr(s, i, 1)
            if (ch == c) n++
        }
        return n
    }
    BEGIN { in_block = 0; depth = 0; inserted = 0 }
    {
        line = $0
        if (!in_block && line ~ /nixosConfigurations = {/) {
            in_block = 1
        }
        if (in_block) {
            opens = count(line, "{")
            closes = count(line, "}")
            new_depth = depth + opens - closes
            if (!inserted && new_depth == 0) {
                print block
                inserted = 1
            }
            depth = new_depth
        }
        print line
    }
    END {
        if (!inserted) {
            print block
        }
    }' "$flake_file" > "${flake_file}.tmp" && mv "${flake_file}.tmp" "$flake_file"
}

setup_configs() {
    # Mirror ./config into ~/.config, creating directories as needed.
    mkdir -p ~/.config
    cp -r ./config/. ~/.config/
}

install() {
    echo -e "\n${RED}START INSTALL PHASE${NORMAL}\n"
    sleep 0.2

    # Create basic directories
    echo -e "Creating folders:"
    echo -e "    - ${MAGENTA}~/Music${NORMAL}"
    echo -e "    - ${MAGENTA}~/Documents${NORMAL}"
    echo -e "    - ${MAGENTA}~/Pictures/wallpapers/others${NORMAL}"
    mkdir -p ~/Music
    mkdir -p ~/Documents
    mkdir -p ~/Pictures/wallpapers/others
    sleep 0.2

    # Copy the wallpapers
    echo -e "Copying all ${MAGENTA}wallpapers${NORMAL}"
    cp -r wallpapers/nixos.jpg ~/Pictures/
    cp -r wallpapers/otherWallpaper/* ~/Pictures/wallpapers/
    ln -s ~/Pictures/wallpapers/nixos.jpg ~/nixos-config/nixos.jpg
    sleep 0.2

    # Get the hardware configuration
    echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${HOST}/${NORMAL}\n"
    cp /etc/nixos/hardware-configuration.nix hosts/${HOST}/hardware-configuration.nix
    sleep 0.2

    # Last Confirmation
    echo -en "You are about to start the system build, do you want to process ? "
    confirm

    # Build the system (flakes + home manager)
    echo -e "\nBuilding the system...\n"
    sudo nixos-rebuild switch --flake .#${HOST}
}

main() {
    init

    print_header

    get_username
    set_username
    get_host

    setup_configs
    install
}

main && exit 0
