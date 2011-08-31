# Whenever sSchedule file. 
# See https://github.com/javan/whenever    

every 1.day, at => '3:00 am' do
  command "cd /home/ubuntu/fund.designbreakdown.com/dbd_fund && bundle exec padrino rake backup:runit trigger='mongodb-backup-s3' "
end