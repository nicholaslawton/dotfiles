#!/usr/bin/env nu

# Deploy and enable the package database refresh service
# This script requires sudo privileges

let service_file = "package-db-refresh.service"
let system_path = "/etc/systemd/system"

print $"Deploying (ansi cyan)($service_file)(ansi reset) to (ansi cyan)($system_path)(ansi reset)..."

# Copy the service file to systemd directory
sudo cp $service_file $system_path

if $env.LAST_EXIT_CODE == 0 {
    print $"✓ (ansi green)Service file copied successfully(ansi reset)"
    
    # Reload systemd daemon
    print "Reloading systemd daemon..."
    sudo systemctl daemon-reload
    
    if $env.LAST_EXIT_CODE == 0 {
        print $"✓ (ansi green)Systemd daemon reloaded(ansi reset)"
        
        # Enable the service
        print "Enabling package-db-refresh service..."
        sudo systemctl enable package-db-refresh.service
        
        if $env.LAST_EXIT_CODE == 0 {
            print $"✓ (ansi green)Service enabled successfully(ansi reset)"

            # Start the service immediately
            print "Starting package-db-refresh service..."
            sudo systemctl start package-db-refresh.service

            if $env.LAST_EXIT_CODE == 0 {
                print $"✓ (ansi green)Service started successfully(ansi reset)"
                print ""
                print "Check status with:"
                print "  sudo systemctl status package-db-refresh.service"
            } else {
                print $"✗ (ansi red)Failed to start service(ansi reset)"
                exit 1
            }
        } else {
            print $"✗ (ansi red)Failed to enable service(ansi reset)"
            exit 1
        }
    } else {
        print $"✗ (ansi red)Failed to reload systemd daemon(ansi reset)"
        exit 1
    }
} else {
    print $"✗ (ansi red)Failed to copy service file(ansi reset)"
    exit 1
}
