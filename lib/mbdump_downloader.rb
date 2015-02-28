require 'net/ftp'
require 'mbdump_downloader/config'

#
# Downloads the latest Musicbrainz data dump from their FTP server and saves it in the location specified by the key
# musicbrainz.download_to in config.yml.
#
module MBDumpDownloader
  def self.download_dumps(last_downloaded)
    ftp = Net::FTP.new(MBDumpDownloader::FTP_SERVER)
    ftp.login
    ftp.passive = true

    ftp.chdir(MBDumpDownloader::DATABASE_DIR)
    files = ftp.list('latest-is-*')
    latest = /latest-is-(.*)/.match(files[0])[1]
    puts "Found latest: #{latest}"

    if last_downloaded == latest
      puts 'Skipping download since latest has not changed'
      return
    end

    download_dir = MBDumpDownloader::DOWNLOAD_TO
    Dir.mkdir(download_dir) unless File.exist?(download_dir)

    ftp.chdir(latest)
    MBDumpDownloader::DOWNLOAD_FILES.each do |file|
      # Skip if file already exists
      existing_file = File.join(download_dir, file)
      if File.exist?(existing_file)
        puts "Skipping #{file} because it already exists at #{download_dir}"
        next
      end

      file_size = ftp.size(file)
      one_mb = 1024 * 1024
      downloaded = 0

      puts "Downloading #{file} (#{file_size / one_mb}mb) to #{download_dir}"

      ftp.getbinaryfile(file, "#{download_dir}/#{file}", one_mb) do
        downloaded += one_mb
        if downloaded % (file_size / 10) < one_mb
          percent = downloaded / (file_size / 10) * 10
          puts "Downloaded #{percent}%"
        end
      end
    end

    ftp.close
    puts "Finished #{latest}"
  end
end
