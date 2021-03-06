#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'types_types'


module Impala
  module Protocol
    class TRowBatch
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NUM_ROWS = 1
      ROW_TUPLES = 2
      TUPLE_OFFSETS = 3
      TUPLE_DATA = 4

      FIELDS = {
      NUM_ROWS => { :type => ::Thrift::Types::I32, :name => 'num_rows' },
      ROW_TUPLES => { :type => ::Thrift::Types::LIST, :name => 'row_tuples', :element => { :type => ::Thrift::Types::I32 } },
      TUPLE_OFFSETS => { :type => ::Thrift::Types::LIST, :name => 'tuple_offsets', :element => { :type => ::Thrift::Types::I32 } },
      TUPLE_DATA => { :type => ::Thrift::Types::LIST, :name => 'tuple_data', :element => { :type => ::Thrift::Types::STRING } }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field num_rows is unset!') unless @num_rows
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field row_tuples is unset!') unless @row_tuples
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TColumnValue
      include ::Thrift::Struct, ::Thrift::Struct_Union
      BOOLVAL = 1
      INTVAL = 2
      LONGVAL = 3
      DOUBLEVAL = 4
      STRINGVAL = 5

      FIELDS = {
      BOOLVAL => { :type => ::Thrift::Types::BOOL, :name => 'boolVal', :optional => true },
      INTVAL => { :type => ::Thrift::Types::I32, :name => 'intVal', :optional => true },
      LONGVAL => { :type => ::Thrift::Types::I64, :name => 'longVal', :optional => true },
      DOUBLEVAL => { :type => ::Thrift::Types::DOUBLE, :name => 'doubleVal', :optional => true },
      STRINGVAL => { :type => ::Thrift::Types::STRING, :name => 'stringVal', :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TResultRow
      include ::Thrift::Struct, ::Thrift::Struct_Union
      COLVALS = 1

      FIELDS = {
      COLVALS => { :type => ::Thrift::Types::LIST, :name => 'colVals', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TColumnValue } }
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

  end
end
