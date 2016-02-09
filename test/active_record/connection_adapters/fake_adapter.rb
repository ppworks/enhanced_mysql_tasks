module ActiveRecord
  module ConnectionHandling
    def fake_connection(config)
      ConnectionAdapters::FakeAdapter.new nil, logger
    end
  end

  module ConnectionAdapters
    class FakeAdapter < AbstractAdapter
      def initialize(connection, logger)
        super
      end
    end
  end
end
