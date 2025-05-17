#1/bin/bash                                
apt update && apt upgrade -y && apt install whois nmap curl dnsutils binutils traceroute nano fortune -y && apt autoremove -y                                       
cd ~/
rm dominium
cd ~/Dominium                                    
cp dominium.sh dominium                              
mv dominium ~/                                   
