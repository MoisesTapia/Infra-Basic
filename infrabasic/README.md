# Verify your infra with this InSpec Profile

![incli](https://github.com/MoisesTapia/Infra-Basic/blob/master/images/verify_infra.png)

# Tools
To verify our infrastructure we need have installed some tools like are:
- [X] [AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [X] [Inspec](https://www.inspec.io/docs/reference/install/)

if you haven't those tools just click over link and follow the intruccions

# Credentials
We need export our AWS credentiasl in the shell:

```bash
# Example configuration
    export AWS_ACCESS_KEY_ID="AKIAJUMP347SLS66IGCQ"
    export AWS_SECRET_ACCESS_KEY="vD2lfoNvPdwsofqyuO9jRuWUkZIMqisdfeFmkHTy7ON+w"
    export AWS_REGION="eu-west-3"
    export AWS_PROFILE=
```
## aws configure
```bash
    AWS Access Key ID [None]: AKIAJUMP347SLS66IGCQ
    AWS Secret Access Key [None]: vD2lfoNvPdwsofqyuO9jRuWUkZIMqisdfeFmkHTy7ON+w
    Default region name [None]: us-west-2
    Default output format [None]: json
```

# Usage
With this `Inspec Profile` you can verify your infra, which was created with terraform 
- [X] Fisrt of all check that tour infra is up in aws
- [X] Give execution permissions the file verify_infra.sh 
- [X] Run the following command: `./verify_infra.sh`
- [X] Wait the report inside of folder.

![verification](https://github.com/MoisesTapia/Infra-Basic/blob/master/images/terraformverify.png)
