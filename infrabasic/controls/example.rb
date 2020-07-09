# copyright: 2018, Moises Pablo Ortiz Tapia
# github https://github.com/MoisesTapia


title "Infra Basic"


control "Intance EC2" do
  impact 0.5
  title "The instance EC2 should be exist"
  desc ""

  describe aws_ec2_instance(name: 'InfraBasic') do
    it  { should_not have_roles }
    it  { should be_running }
    its ('image_id') { should eq 'ami-016b213e' }
    its ('availability_zone') { should eq "us-west-2" }
  end  
end

control "Region of Infra" do
  impact 0.8
  title "Verify de region"
  desc "Verify that ec2 instance are in the correct region with this control"

  describe aws_region('eu-west-2') do
    it { should exist }
    its('endpoint') { should eq 'ec2.eu-west-2.amazonaws.com' }
  end

end
