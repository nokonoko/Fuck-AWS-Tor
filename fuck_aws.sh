echo "Do you wish to format as Nginx deny list?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) wget https://ip-ranges.amazonaws.com/ip-ranges.json && cat ip-ranges.json | jq --raw-output '.prefixes[] | .ip_prefix' > list.txt && awk '{ printf "deny "; print }' list.txt > list1.txt && awk '{print $0";"}' list1.txt > list2.txt && rm -rf list.txt && rm -rf list1.txt ip-ranges.json && mv list2.txt aws_list.txt && echo "Complete!! Saved as aws_list.txt"; break;;
        No ) wget https://ip-ranges.amazonaws.com/ip-ranges.json && cat ip-ranges.json | jq --raw-output '.prefixes[] | .ip_prefix' > aws_list.txt && rm ip-ranges.json && echo "Complete!! Saved as aws_list.txt"; break;;
    esac
done
