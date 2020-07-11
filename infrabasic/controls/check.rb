# copyright: 2018, Moises Pablo Ortiz Tapia
# github https://github.com/MoisesTapia
require 'json'
content = File.read("/home/moisestapia/EMS/Terraform/Infra-Basic/infrabasic/files")
params = JSON.parse(content)

################### Instance EC2 ###################
# Public IP
public_ip_addrs = params['aws_security_group_public_ip']['value']

# images id
id_image = params['aws_instance']['value']

# availability zone
azone_var = params['vpc_cidr']['value']

# Security Group IDS
secgroup_ids = params['vpc_cidr']['value']

title "Infra Basic"


control "Intance EC2" do
  impact 0.5
  title "The instance EC2 should be exist"
  desc ""

  describe aws_ec2_instance('i-0b95f7c75040cff5c') do
    it  { should_not have_roles }
    it  { should be_running }
    its ('image_id') { should eq ['id_image'] }
    its ('availability_zone') { should eq ['azone_var'] }
    its('public_ip_address') { should eq ['public_ip_addrs'] }
    its('security_group_ids') { should include ['secgroup_ids'] }

  end  
end

control "Region of Infra" do
  impact 0.8
  title "Verify de region"
  desc "Verify that ec2 instance are in the correct region with this control"

  describe aws_region('us-east-2') do
    it { should exist }
    its('endpoint') { should eq 'ec2.us-east-2.amazonaws.com' }
  end
end

control "Security Group" do
  impact 1
  title "Verify the security group exist"
  desc "with this control we can verufy the SesGrp"

  describe aws_security_group(group_name: 'terraform-example-sg') do
    it { should exist }
  end
end
