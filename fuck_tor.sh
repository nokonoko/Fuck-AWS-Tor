echo "Do you wish to format as Nginx deny list?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) wget https://check.torproject.org/exit-addresses && grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' exit-addresses > bitch && awk '{ printf "deny "; print }' bitch > bitch1 && awk '{print $0";"}' bitch1 > bitch2 && rm -rf bitch bitch1 exit-addresses && mv bitch2 tor_list.txt && echo "Complete!!! Saved as tor_list.txt"; break;;
        No ) wget https://check.torproject.org/exit-addresses && grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' exit-addresses > tor_list.txt && rm exit-addresses && echo "Complete!! Saved as tor_list.txt"; break;;
    esac
done



