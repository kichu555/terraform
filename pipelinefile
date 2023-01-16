pipeline {

agent any

stages {

 stage ('Checkout Repo') { 
     steps { 
       
       sh '''
       git clone 'https://github.com/kichu555/terraform.git'
       '''
      }
      } 


stage ('Terraform init') { 
  steps {
   sh '''
   cd examples/basic-configuration
   terraform init
   ''' 
   }
   }
   
  stage ('Terraform plan') { 
  steps {
   sh '''
   cd examples/basic-configuration
   terraform plan -out=tfplan.out
   terraform show -json tfplan.out
   ''' 
   }
   }
   
 stage ('Terraform apply') { 
  steps {
   sh '''
   cd examples/basic-configuration
   terraform apply --auto-approve
   ''' 
   }
     } 
     }
     post { 
        always { 
            cleanWs()
         }
        }

  
}
