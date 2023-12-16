#!/bin/bash

# Candidate information
CANDIDATE_ADDRESS="5455 Beechnut St"
CANDIDATE_NAME="Tia Leo"
CANDIDATE_LOCATION="Houston, TX 77580"
CANDIDATE_EMAIL="tialeo@gmail.com"
CANDIDATE_PHONE_NUMBER="787 5854 54554"
CANDIDATE_CURENT_COMPANY="EK TECK"
DATE="08/13/2023"

# Campany information
COMPANY_NAME="Google"
COMPANY_ADDRESS="4884 Macobo Rd"
COMPANY_LOCATION="New York, NY 78524"
EMPLOYERS_NAME="HR Manager"
JOB_BOARD="Indeed"

cat << EOF
$CANDIDATE_NAME
$CANDIDATE_ADDRESS
$CANDIDATE_LOCATION
$CANDIDATE_EMAIL
$CANDIDATE_PHONE_NUMBER
$DATE
$COMPANY_NAME
$COMPANY_ADDRESS
$COMPANY_LOCATION

Dear $EMPLOYERS_NAME,
I am writing to express my strong interest in the DevOps Engineer position at $COMPANY_NAME as advertised on $JOB_BOARD. With a proven track record in optimizing software development processes, enhancing infrastructure, and fostering collaboration between development and operations teams, I am excited to contribute my expertise to your dynamic organization.
In my current role as a DevOps Engineer at $CANDIDATE_CURENT_COMPANY, I have successfully orchestrated continuous integration and continuous deployment (CI/CD) pipelines, reducing deployment times by 40% and enhancing team efficiency. By automating configuration management using tools like Ansible and Terraform, I have improved infrastructure scalability while minimizing manual errors. Collaborating closely with development teams, I have contributed to the adoption of containerization with Docker and Kubernetes, streamlining application deployment and scaling.
My proficiency in cloud services such as Amazon Web Services (AWS) and Azure has allowed me to design resilient and cost-effective architectures. I have experience with Infrastructure as Code (IaC) principles, using tools like CloudFormation and ARM templates to create reproducible environments. Additionally, my background in monitoring and logging solutions, including ELK Stack and Prometheus, ensures robust system observability, rapid issue detection, and timely incident response.
What sets me apart is my ability to bridge the gap between software development and operations through clear communication and collaborative problem-solving. I have a proven history of facilitating cross-functional teamwork, leading to smoother project deliveries and reduced time-to-market. My adaptable nature allows me to quickly learn new technologies and apply them effectively to achieve business goals.
Joining $COMPANY_NAME would provide me with an exciting opportunity to contribute to your innovative projects and make an impact on your infrastructure and development processes. I am impressed by $COMPANY_NAME's dedication to cutting-edge technologies and its commitment to fostering a culture of continuous improvement. I am excited to be a part of a team that values creativity, learning, and collaboration.
Enclosed is my resume, which provides further details about my professional background and accomplishments. I would welcome the opportunity to discuss how my skills and experiences align with your company's needs in greater detail. Thank you for considering my application.
Sincerely,
$CANDIDATE_NAME

EOF