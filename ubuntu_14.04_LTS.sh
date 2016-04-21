sudo adduser root staff

sudo mkdir -p /opt/local/bin/
sudo sh -c "echo 'PATH=\$PATH:/opt/local/bin' >> /etc/bash.bashrc"

sudo mkdir /opt/Tools
sudo chmod 777 /opt/Tools
cd /opt/Tools

###
# SSH, Git, and cmake
###
sudo apt-get install openssh-server 
sudo apt-get install git
sudo apt-get install cmake

####
# Last version of R
###
sudo sh -c "echo 'deb https://cran.univ-paris1.fr/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list"
sudo apt-get update
sudo apt-get install r-base


#####
# Rstudio Server
#####
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-0.99.896-amd64.deb
sudo gdebi rstudio-server-0.99.896-amd64.deb
rm rstudio-server-0.99.896-amd64.deb

###
# Samtools
###
wget https://github.com/samtools/samtools/releases/download/1.3/samtools-1.3.tar.bz2
tar -xjvf samtools*
rm samtools-1.3.tar.bz2
cd samtools-1.3
./configure
make
cd ..
sudo ln -s  /opt/Tools/samtools-1.3/samtools /opt/local/bin

###
# Bowtie2
###
wget "http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.8/bowtie2-2.2.8-linux-x86_64.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.2.8%2F&ts=1461156134&use_mirror=ufpr"
mv bowtie2-2.2.* bowtie2-2.2.8-linux-x86_64.zip
unzip bowtie2-2.2.8-linux-x86_64.zip
rm bowtie2-2.2.8-linux-x86_64.zip
sudo ln -s  /opt/Tools/bowtie2-2.2.8/bowtie2* /opt/local/bin

###
# STAR
###
wget https://github.com/alexdobin/STAR/archive/2.5.1b.zip
unzip 2.5.1b.zip
rm 2.5.1b.zip
cd STAR-2.5.1b
make
sudo ln -s /opt/Tools/STAR-2.5.1b/source/STAR /opt/local/bin
cd ..

###
# VSearch
###
wget https://github.com/torognes/vsearch/releases/download/v1.11.1/vsearch-1.11.1-linux-x86_64.tar.gz
tar -xzvf vsearch-1.11.1-linux-x86_64.tar.gz 
rm vsearch-1.11.1-linux-x86_64.tar.gz
sudo ln -s /opt/Tools/vsearch-1.11.1-linux-x86_64/bin/vsearch /opt/local/bin/

###
# Subread
###
wget "http://downloads.sourceforge.net/project/subread/subread-1.5.0-p2/subread-1.5.0-p2-source.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fsubread%2Ffiles%2Fsubread-1.5.0-p2%2F&ts=1461157751&use_mirror=iweb"
mv subread* subread-1.5.0-p2-source.tar.gz
tar -xzvf subread-1.5.0-p2-source.tar.gz
rm subread-1.5.0-p2-source.tar.gz
cd subread-1.5.0-p2-source/src
make -f Makefile.Linux
cd ../../
sudo ln -s /opt/Tools/subread-1.5.0-p2-source/bin/* /opt/local/bin/

###
# BEdTools
###
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -xzvf bedtools-2.25.0.tar.gz
rm bedtools-2.25.0.tar.gz
cd bedtools-2
make
cd ..
sudo ln -s /opt/Tools/bedtools2/bin /opt/local/bin/

###
# BWA
###
wget "http://downloads.sourceforge.net/project/bio-bwa/bwakit/bwakit-0.7.12_x64-linux.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbio-bwa%2Ffiles%2F&ts=1461157875&use_mirror=nbtelecom"
mv bwakit-0.7.12_x64-linux.tar.bz2* bwakit-0.7.12_x64-linux.tar.bz2
tar -xjvf bwakit-0.7.12_x64-linux.tar.bz2
rm bwakit-0.7.12_x64-linux.tar.bz2
sudo ln -s /opt/Tools/bwa.kit/bwa /opt/local/bin/

###
# Picard Tools
###
wget https://github.com/broadinstitute/picard/releases/download/2.2.1/picard-tools-2.2.1.zip
unzip picard-tools-2.2.1.zip
rm picard-tools-2.2.1.zip
sudo sh -c "echo 'alias picard=\"java -jar /opt/Tools/picard-tools-2.2.1/picard.jar\"' >> /etc/bash.bashrc"


###
# GATK
###
# Difficult to automate
# 1) GET GATK on the website
# tar -xjvf GenomeAnalysisTK-3.5.tar.bz2
# sudo sh -c "echo 'alias gatk=\"java -jar /opt/Tools/GATK3.5/GenomeAnalysisTK.jar\"' >> /etc/bash.bashrc"

###
# IGV
###
wget http://data.broadinstitute.org/igv/projects/downloads/IGV_2.3.72.zip
unzip IGV_2.3.72.zip
sudo ln -s /opt/Tools/IGV_2.3.72/igv.sh /opt/local/bin

###
# VARSCan
###
wget "http://downloads.sourceforge.net/project/varscan/VarScan.v2.3.9.jar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fvarscan%2Ffiles%2F&ts=1461167028&use_mirror=iweb"
mv VarScan* VarScan.v2.3.9.jar
sudo sh -c "echo 'alias varscan=\"java -jar /opt/Tools/VarScan.v2.3.9.jar\"' >> /etc/bash.bashrc"


###
# FASTQC
###
wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
unzip fastqc_v0.11.5.zip
chmod +x FastQC/fastqc
ln -s /opt/Tools/FastQC/fastqc /opt/local/bin

###
# JAVA 8 Oracle
###
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

###
# Python Matplotlib & Numpy
###
sudo apt-get install python-numpy
sudo apt-get install python3-numpy
sudo apt-get install python-matplotlib
sudo apt-get install python3-matplotlib

###
# Fastq-mcf
###
sudo apt-get install gsl-bin
sudo apt-get install libgsl0-dev
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ea-utils/ea-utils.1.1.2-537.tar.gz
tar -xzvf ea-utils.1.1.2-537.tar.gz
cd ea-utils.1.1.2-537
make
cd ..
find ea-utils.1.1.2-537 -type f -executable -exec sh -c "sudo ln -s /opt/Tools/{} /opt/local/bin" \;

###
# Fantompeakqualtool
###
sudo apt-get install libboost-all-dev
wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/phantompeakqualtools/ccQualityControl.v.1.1.tar.gz
tar -xzvf ccQualityControl.v.1.1.tar.gz
sudo R -e "install.packages('caTools',lib='/usr/local/lib/R/site-library/',repo='http://cran.univ-paris1.fr/')"
sudo R -e "install.packages('snow',lib='/usr/local/lib/R/site-library', repo='http://cran.univ-paris1.fr/')"


###
# DEXSeq
###
sudo apt-get install libcurl4-gnutls-dev libxml2 libxml2-dev libreadline6-dev
sudo R -e "source('https://bioconductor.org/biocLite.R');biocLite('DEXSeq',lib='/usr/local/lib/R/site-library')"
sudo chmod +x /usr/local/lib/R/library/DEXSeq/python_scripts/*
sudo sh -c "echo 'alias dexseq_count=\"python /usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_count.py\"' >> /etc/bash.bashrc"
sudo sh -c "echo 'alias dexseq_prepare_annotation=\"python /usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py\"' >> /etc/bash.bashrc"

###
# MACS2
###
sudo apt-get install python-pip
sudo pip install MACS2

###
# IDR
###
wget "https://sites.google.com/site/anshulkundaje/projects/idr/idrCode.tar.gz?attredirects=0"
mv idrCode* idrCode.tar.gz
tar -xzvf idrCode.tar.gz
rm idrCode.tar.gz

###
# Freebayes
###
git clone --recursive git://github.com/ekg/freebayes.git
cd freebayes
make
sudo ln -s /opt/Tools/freebayes/bin/* /opt/local/bin/
sudo ln -s /opt/Tools/freebayes/scripts/* /opt/local/bin/
cd ..

###
# VCFlib
###
git clone --recursive git://github.com/ekg/vcflib.git
cd vcflib
make
cd ..
sudo ln -s /opt/Tools/vcflib/bin/* /opt/local/bin/

###
# VCF Tools
###
wget https://github.com/vcftools/vcftools/releases/download/v0.1.14/vcftools-0.1.14.tar.gz
tar -xzvf vcftools-0.1.14.tar.gz
cd vcftools-0.1.14/
./configure
make
sudo make install
cd ..

###
# SNPEff
###
wget http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip
unzip snpEff_latest_core.zip
sudo ln -s /opt/Tools/snpEff/scripts/* /opt/local/bin/
sudo ln -s /opt/Tools/snpEff/*.jar /opt/local/

###
# Snippy
###
sudo apt-get install bioperl
sudo apt-get install parallel
wget https://github.com/tseemann/snippy/archive/v3.0.tar.gz
tar -xzvf v3.0.tar.gz
rm v3.0.tar.gz
sudo ln -s /opt/Tools/snippy-3.0/bin/* /opt/local/bin/
