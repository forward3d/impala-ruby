#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'exprs_types'
require 'types_types'
require 'descriptors_types'
require 'partitions_types'


module Impala
  module Protocol
    module TDataSinkType
      DATA_STREAM_SINK = 0
      TABLE_SINK = 1
      VALUE_MAP = { 0 => "DATA_STREAM_SINK", 1 => "TABLE_SINK" }
      VALID_VALUES = Set.new([DATA_STREAM_SINK, TABLE_SINK]).freeze
    end

    class TDataStreamSink
      include ::Thrift::Struct, ::Thrift::Struct_Union
      DEST_NODE_ID = 1
      OUTPUT_PARTITION = 2

      FIELDS = {
      DEST_NODE_ID => { :type => ::Thrift::Types::I32, :name => 'dest_node_id' },
      OUTPUT_PARTITION => { :type => ::Thrift::Types::STRUCT, :name => 'output_partition', :class => Impala::Protocol::TDataPartition }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field dest_node_id is unset!') unless @dest_node_id
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field output_partition is unset!') unless @output_partition
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THdfsTableSink
      include ::Thrift::Struct, ::Thrift::Struct_Union
      PARTITION_KEY_EXPRS = 1
      OVERWRITE = 2

      FIELDS = {
      PARTITION_KEY_EXPRS => { :type => ::Thrift::Types::LIST, :name => 'partition_key_exprs', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr } },
      OVERWRITE => { :type => ::Thrift::Types::BOOL, :name => 'overwrite' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field partition_key_exprs is unset!') unless @partition_key_exprs
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field overwrite is unset!') if @overwrite.nil?
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TTableSink
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TARGET_TABLE_ID = 1
      HDFS_TABLE_SINK = 2

      FIELDS = {
      TARGET_TABLE_ID => { :type => ::Thrift::Types::I32, :name => 'target_table_id' },
      HDFS_TABLE_SINK => { :type => ::Thrift::Types::STRUCT, :name => 'hdfs_table_sink', :class => Impala::Protocol::THdfsTableSink }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field target_table_id is unset!') unless @target_table_id
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field hdfs_table_sink is unset!') unless @hdfs_table_sink
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TDataSink
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TYPE = 1
      STREAM_SINK = 2
      TABLE_SINK = 3

      FIELDS = {
      TYPE => { :type => ::Thrift::Types::I32, :name => 'type', :enum_class => Impala::Protocol::TDataSinkType },
      STREAM_SINK => { :type => ::Thrift::Types::STRUCT, :name => 'stream_sink', :class => Impala::Protocol::TDataStreamSink, :optional => true },
      TABLE_SINK => { :type => ::Thrift::Types::STRUCT, :name => 'table_sink', :class => Impala::Protocol::TTableSink, :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field type is unset!') unless @type
        unless @type.nil? || Impala::Protocol::TDataSinkType::VALID_VALUES.include?(@type)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field type!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

  end
end
