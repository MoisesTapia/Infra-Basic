# copyright: 2018, Moises Pablo Ortiz Tapia
# github https://github.com/MoisesTapia


title "Infra Basic"


control "Intance EC2" do
  impact 0.5
  title "The instance EC2 should be exist"
  desc ""

  describe aws_ec2_instance('i-0b95f7c75040cff5c') do
    it  { should_not have_roles }
    it  { should be_running }
    its ('image_id') { should eq 'ami-016b213e65284e9c9' }
    its ('availability_zone') { should eq "us-east-2b" }

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
  desc "with this control we can verufy the SG"

  describe aws_security_group(group_name: 'terraform-example-sg') do
    it { should exist }
  end
end
