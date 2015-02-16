Ohai.plugin(:Users) do
  provides 'user_plugin'

    def ReadUsersMash(mash)
    file = File.open("/etc/passwd")
    file.each_line do |line|
       user_line = line.strip.split(':')
       mash[user_line[0]] = user_line.drop(1)
    end
    file.close
  end

  collect_data(:linux) do
    user_plugin Mash.new

    user_plugin['user_mash'] = Mash.new
    ReadUsersMash(user_plugin['user_mash'])

  end
end
