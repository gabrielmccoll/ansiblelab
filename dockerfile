FROM centos:centos7.7.1908

RUN yum check-update; \
   yum install -y gcc libffi-devel python3 epel-release; \
   yum install -y openssh-clients; \
   yum install -y sshpass; \
   curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo; \
   yum install -y powershell; \
   pwsh -c "Set-PackageSource -Name PSGallery -Trusted"; \
   pwsh -c "Install-Module AZ -Scope AllUsers"; \
   pip3 install --upgrade pip

RUN pip3 install "ansible==2.9.12"; \ 
   pip3 install ansible[azure]; \
   pip3 install "pywinrm>=0.3.0"