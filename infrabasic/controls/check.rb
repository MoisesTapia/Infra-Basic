require 'json'
content = File.read("/home/moisestapia/EMS/Terraform/Infra-Basic/infrabasic/files/terraform.json")
params = JSON.parse(content)

# copyright: 2018, Moises Tapia
# github https://github.com/MoisesTapia

################### Instance EC2 
# images id
id_image = params['aws_instance']['value']
# AMI Image
ami_image = params['ec2_instance_ami']['value']
# Public IP
public_ip_addrs = params['secgroup_public_ip']['value']
# availability zone
azone_var = params['secgroup_av_zone']['value']
# Security Group IDS
secgroup_ids = params['security_group_id']['value'] 

################### Internal VARS
ENDPOINT_NAME = attribute('endpointname') #
STATE_VPC = attribute('vpcstate')         # YOU CAN MODIIFY THIS ATTRIBUTES inspec.yml
REGION_INFRA = attribute('region')        #
DEFAULT_VPC = attribute('defaultvpc')     #

title "Test of Infra-Security "


control "Testing 01 - Intance EC2" do
  impact 0.5
  title "The instance EC2 should be exist"
  desc ""

  describe aws_ec2_instance(id_image) do
    it                          { should_not have_roles }
    it                          { should be_running }
    its ('image_id')            { should eq ami_image }
    its ('availability_zone')   { should eq azone_var }
    its ('public_ip_address')   { should eq public_ip_addrs }
    its ('security_group_ids')  { should include secgroup_ids }
    its ('vpc_id')              { should eq DEFAULT_VPC }

  end  
end

control "Testing 02 - VPC Check" do
  impact 0.5
  title "Verify VPC"
  desc "---"

  describe aws_vpc do
    its ('state') { should eq STATE_VPC }
  end

  describe aws_vpc(DEFAULT_VPC) do
    it            { should be_default }
  end
  

end

control "Testing 03 - Region of Infra" do
  impact 0.8
  title "Verify de region"
  desc "Verify that ec2 instance are in the correct region with this control"

  describe aws_region(REGION_INFRA) do
    it              { should exist }
    its('endpoint') { should eq ENDPOINT_NAME }
  end
end

control "Testing 04 - Security Group" do
  impact 1
  title "Verify the security group exist"
  desc "with this control we can verufy the SesGrp"

  describe aws_security_group(group_name: 'terraform-example-sg') do
    it { should exist }
  end
end
