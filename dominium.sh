#!/bin/bash
clear
while true; do
echo -e "\e[1;91m
     
 =======   ======   =========  === ==== === === ===  ===  =========
 ===  === ===  === === === === === ======== === ===  === === === ===
 ===  === ===  === === === === === ======== === ===  === === === ===
 ===  === ===  === ===     === === === ==== === ===  === ===     ===
 =======   ======  ===     === === ===  === ===  ======  ===     ===     "

      echo -e "\e[1;91m                                                                                                                                    
 + -- --=[ \e[1;94msimple.osint.builds v1.1.2    \e[1;91m]
 + -- --=[ \e[1;94mhttps://github.com/ghoste9624 \e[1;91m]
 + -- --=[ \e[1;94mDominium > Domain Full Scan   \e[1;91m]\e[1;97m"     
      echo ""
      read -p "  Run Dominium? [y/n] > " choice
      case $choice in
    y)
      echo -e " \e[1;92m>>> \e[3mYou have chosen wisely...\e[0m"
      echo ""
      echo -e " \e[1;91m>>> \e[1;94mEnter Domain \e[1;91m|\e[1;96m example.com \e[1;91m|"
      echo -e "\e[1;92m"
      read -p " Target > " target
      content=$(curl -s "$target")
      whois $target | tee -a ~/Dominium/scans/$target
      echo -e "\e[1;92m"
      curl -i https://$target/page | tee -a ~/Dominium/scans/$target      
      echo -e "\e[1;92m"
      curl -ILk $target | tee -a ~/Dominium/scans/$target      
      echo -e "\e[1;92m"
      curl -Lk $target/robots.txt | tee -a ~/Dominium/scans/$target
      echo -e "\e[1;92m"
      nslookup $target | tee -a ~/Dominium/scans/$target
      echo -e "\e[1;92m"
      host -a -A $target | tee -a ~/Dominium/scans/$target
      dig $target +trace ANY | tee -a ~/Dominium/scans/$target
      echo -e "\e[1;92m"
      nmap -sV -A $target --script-trace --script=http-headers --unprivileged | tee -a ~/Dominium/scans/$target
      echo -e "\e[1;92m"
      traceroute $target | tee -a ~/Dominium/scans/$target
      nano ~/Dominium/scans/$target 
      echo ""
      echo -e " \e[1;94mFile Saved \e[1;91m> \e[1;96m~/Dominium/scans/$target\e[1;97m"
      ;;
    n)
      echo ""
      command=(fortune)
      "${command[@]}"
      echo ""
      echo -e " \e[1;91m>>> \e[3mExiting...\e[0m\e"
      echo ""
      break
      ;;
    *)
      echo -e " \e[1;91m>>> \e[3mInvalid choice, Please try again...\e[0m\e[1;97m"
      echo ""
      ;;
  esac
done
