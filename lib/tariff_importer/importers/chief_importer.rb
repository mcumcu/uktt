require 'csv'

require 'active_support/notifications'
require 'active_support/log_subscriber'
require 'tariff_importer/logger'

require 'tariff_importer/importers/chief_importer/entry'
require 'tariff_importer/importers/chief_importer/start_entry'
require 'tariff_importer/importers/chief_importer/end_entry'
require 'tariff_importer/importers/chief_importer/change_entry'

require 'tariff_importer/importers/chief_importer/strategies/base_strategy'
require 'tariff_importer/importers/chief_importer/strategies/strategies'

class ChiefImporter
  class ImportException < StandardError
    attr_reader :original

    def initialize(msg = "ChiefImporter::ImportException", original=$!)
      super(msg)
      @original = original
    end
  end

  cattr_accessor :relevant_tables
  self.relevant_tables = %w(MFCM TAMF TAME)

  cattr_accessor :start_mark
  self.start_mark = "AAAAAAAAAAA"

  cattr_accessor :end_mark
  self.end_mark = "ZZZZZZZZZZZ"

  attr_reader :path, :processor, :start_entry, :end_entry, :file_name

  delegate :extraction_date, to: :start_entry, allow_nil: true
  delegate :record_count, to: :end_entry, allow_nil: true

  def initialize(path)
    @path = Pathname.new(path)
    @file_name = @path.basename.to_s
  end

  def import
    begin
      CSV.foreach(path, encoding: 'ISO-8859-1') do |line|
        entry = Entry.build(line)

        if entry.is_a?(StartEntry)
          @start_entry = entry
        elsif entry.is_a?(EndEntry)
          @end_entry = entry
        else # means it's ChangeEntry
          next unless entry.relevant?

          entry.origin = file_name
          entry.process!
        end
      end

      ActiveSupport::Notifications.instrument("chief_imported.tariff_importer", path: path,
                                                                                date: extraction_date,
                                                                                count: record_count)
    rescue Exception => exception
      ActiveSupport::Notifications.instrument("chief_failed.tariff_importer", path: path,
                                                                              exception: exception)

      raise ImportException.new(exception.message, exception)
    end
  end
end
