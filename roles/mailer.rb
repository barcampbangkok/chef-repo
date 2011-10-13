name 'mailer'
description 'Configures systems for sending mail'

# This is just basic local postfix sendmail at this point -- you of course
# will need to configure DNS/SPF and other things to improve deliverability

override_attributes(
  :postfix => {
    :myorigin => '$mydomain'
  }
)

run_list(
  'recipe[postfix]'
)

