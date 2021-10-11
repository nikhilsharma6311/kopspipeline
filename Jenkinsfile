#!groovy

node {

	def CLUSTERNAME='nikhilsharmadev.click'
    def S3BUCKET='nikhilsharmadev.click'
    def ZONE= 'ap-south-1a,ap-south-1b'
    def NODECOUNT='1'
	def NODESIZE= 't2.micro'
	def MASTERCOUNT= '1'
	def MASTERSIZE = 't2.micro'
    def DNS= 'nikhilsharmadev.click'
	def KEY='C:\\Users\\nikhilsharma02\\.ssh\\id_rsa.pub'
	
    
        stage('Setup parameters') {
                script {
				properties([parameters([choice(choices: ['Apply', 'Destroy'], name: 'TerraformAction')])])
				}
			}
		stage('Clean Workspace') {
			def file = fileExists 'terraform.tfstate.backup'
            if ((params.TerraformAction == 'Apply') && (file))
            try {
                deleteDir()
            }
            catch (Exception e) {
                println('Unable to Clean WorkSpace.')
            }
        }
		stage('Kops Cluster Creation') {
			def file = fileExists 'kubernetes.tf'
            if (!file)
	        {
             bat "kops create cluster --name=${CLUSTERNAME} --state=s3://${S3BUCKET} --authorization RBAC --zones=${ZONE} --node-count=${NODECOUNT} --node-size=${NODESIZE} --master-size=${MASTERSIZE} --master-count=${MASTERCOUNT} --dns-zone=${DNS} --out=. --target=terraform --ssh-public-key=${KEY}"   
            }
		}
		
		stage('Terraform Apply') {
			def file = fileExists 'terraform.tfstate'
			if ((params.TerraformAction == 'Apply') && (!file))
		    {
                    echo 'Creating Resources'
					bat 'terraform init'
					bat 'terraform apply --auto-approve'
					sleep(time: 10, unit: "MINUTES")
                   }
				}
		stage('Promethus installation and Configuration') {
			if ((params.TerraformAction == 'Apply'))
			{
			try {
              bat"""
                kubectl create namespace prometheus
                helm install prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2" --set server.persistentVolume.storageClass="gp2"
				"""
				sleep(time: 2, unit: "MINUTES")
				}
			catch (Exception e) {
                println('Seem Like  Promethus service already Created or Please check the logs')
				bat 'kubectl get all -n prometheus'
            }	
            }
		}
		stage('Grafana installation and Configuration') {
			if ((params.TerraformAction == 'Apply'))
			{
			try {
             bat"""
                kubectl create namespace grafana
                helm install grafana grafana/grafana --namespace grafana --set persistence.storageClassName="gp2" --set persistence.enabled=true --set adminPassword='EKS!sAWSome' --values C:\\Users\\nikhilsharma02\\Desktop\\grafana.yaml --set service.type=LoadBalancer
                """
				sleep(time: 2, unit: "MINUTES")				
            }
			catch (Exception e) {
                println('Seem Like Grafana service already Created or Please check the logs')
				bat ''
            }	
		}
		}
		stage('Promethus and Grafana uninstallation') {
			def file = fileExists 'terraform.tfstate.backup'
			if ((params.TerraformAction == 'Destroy') && (!file))
			{
			try {
              bat"""
			  helm uninstall prometheus --namespace prometheus
			  kubectl delete ns prometheus
              helm uninstall grafana --namespace grafana
              kubectl delete ns grafana
			  """
			}
			catch (Exception e) {
                println('Not able to Uninstall Promethus and Grafana ! Seems like  already Uninstalled')
				bat 'kubectl get all -n grafana'
            }
			  
            }
		}
		stage('Terraform Destroy') {
			def file = fileExists 'terraform.tfstate.backup'
			if ((params.TerraformAction == 'Destroy') && (!file))
			{
                    echo 'Destroying Resources'
					bat 'terraform destroy --auto-approve'
			
            }
		}
		stage('Kops Cluster Deletion') {
		if (params.TerraformAction == 'Destroy')
		{
		bat "kops delete cluster --name ${CLUSTERNAME} --state=s3://${S3BUCKET} --yes"
		}
		}
    }
