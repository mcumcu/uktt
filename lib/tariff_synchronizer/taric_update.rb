require 'tariff_synchronizer/base_update'
require 'tariff_synchronizer/file_service'

module TariffSynchronizer
  class TaricUpdate < BaseUpdate
    self.update_priority = 2

    def self.download(date)
      if file_name = get_taric_path(date)
        taric_data_url = "#{TariffSynchronizer.host}/taric/#{file_name}"
        TariffSynchronizer.logger.info "Downloading Taric file for #{date} at: #{taric_data_url}"
        FileService.get_content(taric_data_url).tap{|contents|
          FileService.write_file(update_path(date, file_name), contents) if contents.present?
        }
      else
        TariffSynchronizer.logger.error "No Taric file found for #{date}."
      end
    end

    def apply
      TariffImporter.new(file_path, TaricImporter).import
      logger.info "Successfully applied Taric update: #{file_path}"
      move_to :processed
    end

    def self.update_type
      :taric
    end

    def self.query_for_last_file
      "#{TariffSynchronizer.root_path}/**/*.xml"
    end

    private

    def self.get_taric_path(date)
      date_query = Date.parse(date.to_s).strftime("%Y%m%d")
      taric_query_url = "#{TariffSynchronizer.host}/taric/TARIC3#{date_query}"
      TariffSynchronizer.logger.info "Checking for Taric file for #{date} at: #{taric_query_url}"
      FileService.get_content(taric_query_url).tap { |file_name|
        file_name.gsub!(/[^0-9a-zA-Z\.]/i, '') if file_name.present?
      }
    end
  end
end
