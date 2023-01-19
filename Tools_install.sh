#!/usr/bin/env bash
#Mythily_Tools.sh
#Author:R4GH4V

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt install -y libpcap-dev
apt-get install -y jq
sudo apt-get install -y gcc
apt install unzip
apt install -y python3-pip
sudo apt-get install -y cmake
pip3 install uro
sudo apt-get --assume-yes install git make gcc

mkdir -p tools/sub-finder
mkdir -p tools/crawler
mkdir -p tools/others

echo "Installing Golang"
curl -LO https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc	
source .bashrc

# Install Subfinder
echo "[*] Installing Subfinder..."
if command -v subfinder >/dev/null 2>&1 ; then
    echo "Subfinder already installed"
else
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    if command -v subfinder >/dev/null 2>&1 ; then
        echo "Subfinder installed successfully"
    else
        echo "Failed to install Subfinder"
    fi
fi


# Install Amass
echo "[*] Installing Amass..."
if command -v amass >/dev/null 2>&1 ; then
    echo "Amass already installed"
else
    snap install amass
fi

# Install Httpx
echo "[*] Installing Httpx..."
if command -v httpx >/dev/null 2>&1 ; then
    echo "Httpx already installed"
else
    snap istall httpx
fi

# Install Masscan
echo "[*] Installing Masscan..."
if command -v masscan >/dev/null 2>&1 ; then
    echo "Masscan already installed"
else
    apt-get install -y masscan
fi

# Install Anew
echo "[*] Installing Anew..."
if command -v anew >/dev/null 2>&1 ; then
    echo "Anew already installed"
else
    go install github.com/tomnomnom/anew@latest
fi

# Install Nmap
echo "[*] Installing Nmap..."
if command -v nmap >/dev/null 2>&1 ; then
    echo "Nmap already installed"
else
    apt-get install -y nmap
fi

# Install Nabbu
echo "[*] Installing Nabbu..."
if command -v naabu >/dev/null 2>&1 ; then
    echo "Nabbu already installed"
else
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
fi

# Install Nuclei
echo "[*] Installing Nuclei..."
if command -v nuclei >/dev/null 2>&1 ; then
    echo "Nuclei already installed"
else
    go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
fi

# Install Waybackurls
echo "[*] Installing Waybackurls..."
if command -v waybackurls >/dev/null 2>&1 ; then
    echo "Waybackurls already installed"
else
    go install github.com/tomnomnom/waybackurls@latest
fi

# Install Gauplus
echo "[*] Installing Gauplus..."
if command -v gauplus >/dev/null 2>&1 ; then
    echo "Gauplus already installed"
else
    go install github.com/bp0lr/gauplus@latest
fi

echo "Installing Httprobe"
if command -v httprobe >/dev/null 2>&1 ; then
    echo "Httprobe already installed"
else
    go install github.com/tomnomnom/httprobe@latest
fi

echo "Installing GoBuster"
if command -v gobuster >/dev/null 2>&1 ; then
    echo "GoBuster already installed"
else
    go install github.com/OJ/gobuster/v3@latest
fi

echo "Installing GauPlus"
if command -v gauplus >/dev/null 2>&1 ; then
    echo "GauPlus already installed"
else
    go install github.com/bp0lr/gauplus@latest
fi

echo "Installing Gau"
if command -v gau >/dev/null 2>&1 ; then
    echo "Gau already installed"
else
    go install github.com/lc/gau/v2/cmd/gau@latest
fi

echo "Installing FFUF"
if command -v ffuf >/dev/null 2>&1 ; then
    echo "FFUF already installed"
else
    go install github.com/ffuf/ffuf@latest
fi

echo "Installing Assetfinder"
if command -v assetfinder >/dev/null 2>&1 ; then
    echo "Assetfinder already installed"
else
    go install github.com/tomnomnom/assetfinder@latest
fi

echo "Installing ShuffleDNS"
if command -v shuffledns >/dev/null 2>&1 ; then
    echo "ShuffleDNS already installed"
else
    go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
fi

echo "Installing Katana"
if command -v katana >/dev/null 2>&1 ; then
    echo "Katana already installed"
else
    go install github.com/projectdiscovery/katana/cmd/katana@latest
fi

echo "Installing GoSpider"
if command -v gospider >/dev/null 2>&1 ; then
    echo "GoSpider already installed"
else
    go install github.com/jaeles-project/gospider@latest
fi

echo "Installing Hakrawler"
if command -v hakrawler >/dev/null 2>&1 ; then
    echo "Hakrawler already installed"
else
    go install github.com/hakluke/hakrawler@latest
fi

echo "Installing Freq"
if command -v freq >/dev/null 2>&1 ; then
    echo "Freq already installed"
else
    go install github.com/takshal/freq@latest
fi

echo "Installing QSReplace"
if command -v qsreplace >/dev/null 2>&1 ; then
    echo "QSReplace already installed"
else
    go install github.com/tomnomnom/qsreplace@latest
fi

echo "Installing Subjack"
if command -v subjack >/dev/null 2>&1 ; then
    echo "Subjack already installed"
else
    go install github.com/haccer/subjack@latest
fi

#Installing TOOLS
echo "[*] Installing findomain"
if command -v findomain >/dev/null 2>&1 ; then
    echo "findomain already installed"
else
    curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
    unzip findomain-linux.zip
    chmod +x findomain
    cp findomain /usr/bin/findomain
fi

#install Github-subdomain.py
echo "Installing GithubSubdomain"
if [ -d "tools/sub-finder/github-search" ]; then
    echo "GithubSubdomain already installed"
else
    git clone https://github.com/gwen001/github-search.git tools/sub-finder/github-search
    pip3 install -r tools/sub-finder/github-search/requirements.txt
fi

#install subDomainizer
echo "Installing subDomainizer"
if [ -d "tools/sub-finder/SubDomainizer" ]; then
    echo "subDomainizer already installed"
else
    git clone https://github.com/nsonaniya2010/SubDomainizer.git  tools/sub-finder/SubDomainizer
    pip3 install htmlmin
    pip3 install -r tools/sub-finder/SubDomainizer/requirements.txt
fi

#install sub.sh
echo "Installing sub.sh"
if [ -d "tools/sub-finder/sub.sh" ]; then
    echo "sub.sh already installed"
else
    git clone https://github.com/cihanmehmet/sub.sh.git tools/sub-finder/sub.sh
    chmod +x tools/sub-finder/sub.sh/sub.sh
    bash tools/sub-finder/sub.sh/sub.sh -i 
fi

#install subbrute
echo "Installing Subbrute"
if [ -d "tools/sub-finder/subbrute" ]; then
    echo "Subbrute already installed"
else
    git clone https://github.com/TheRook/subbrute.git tools/sub-finder/subbrute
fi

#install waymore
echo "Installing Waymore"
if [ -d "tools/crawler/waymore" ]; then
    echo "Waymore already installed"
else
    git clone https://github.com/xnl-h4ck3r/waymore.git tools/crawler/waymore
    pip3 install -r tools/crawler/waymore/requirements.txt
fi
#add api key from notion

#install paramspider
echo "Installing Paramspider"
if [ -d "tools/crawler/ParamSpider" ]; then
    echo "Paramspider already installed"
else
    git clone https://github.com/devanshbatham/ParamSpider tools/crawler/ParamSpider
    pip3 install -r tools/crawler/ParamSpider/requirements.txt
fi

#install ragno
echo "Installing Ragno"
if [ -d "tools/crawler/ragno" ]; then
    echo "Ragno already installed"
else
    git clone https://github.com/PushpenderIndia/ragno.git tools/crawler/ragno
    pip3 install numpy requests
    chmod +x tools/crawler/ragno/ragno.py
fi

#install urldedupe
if [ -d "tools/others/urldedupe" ]; then
    echo "urldedupe already installed"
else
    git clone https://github.com/ameenmaali/urldedupe.git tools/others/urldedupe
    cmake tools/others/urldedupe/CMakeLists.txt
    cd tools/others/urldedupe && make && cd
    cp tools/others/urldedupe/urldedupe /usr/local/bin
    chmod +x /usr/local/bin/urldedupe 
fi

if [ -d "tools/others/massdns" ]; then
    echo "massdns already installed"
else
    git clone https://github.com/blechschmidt/massdns.git tools/others/massdns
    cd tools/others/massdns && make && sudo make install && cd
fi

if command -v masscan >/dev/null 2>&1 ; then
    echo "masscan already installed"
else
   




echo "All tools have been installed"


