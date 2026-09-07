clear

echo -e "\e[5m\e[1;34m$(figlet 'SecEye')\e[0m"
echo Setup Starting........

sudo apt-get install ruby  
echo ""
sudo gem install uri
echo ""
sudo gem install net-http
echo ""
sudo gem install colorize
echo ""
sudo gem install json
echo ""
sudo gem install prawn
echo ""
sudo gem install ruby_llm
echo ""
sudo gem install open3
echo ""
sudo gem install shellwords
echo ""
sudo gem install readline

sudo chmod +x youragent
echo "\n***done***\n"
clear
echo ""
echo Setup Complete GO AHEAD!!!!!!        