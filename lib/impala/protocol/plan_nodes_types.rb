#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'exprs_types'
require 'types_types'


module Impala
  module Protocol
    module TPlanNodeType
      HDFS_SCAN_NODE = 0
      HBASE_SCAN_NODE = 1
      HASH_JOIN_NODE = 2
      AGGREGATION_NODE = 3
      SORT_NODE = 4
      EXCHANGE_NODE = 5
      MERGE_NODE = 6
      VALUE_MAP = { 0 => "HDFS_SCAN_NODE", 1 => "HBASE_SCAN_NODE", 2 => "HASH_JOIN_NODE", 3 => "AGGREGATION_NODE", 4 => "SORT_NODE", 5 => "EXCHANGE_NODE", 6 => "MERGE_NODE" }
      VALID_VALUES = Set.new([HDFS_SCAN_NODE, HBASE_SCAN_NODE, HASH_JOIN_NODE, AGGREGATION_NODE, SORT_NODE, EXCHANGE_NODE, MERGE_NODE]).freeze
    end

    module TJoinOp
      INNER_JOIN = 0
      LEFT_OUTER_JOIN = 1
      LEFT_SEMI_JOIN = 2
      RIGHT_OUTER_JOIN = 3
      FULL_OUTER_JOIN = 4
      VALUE_MAP = { 0 => "INNER_JOIN", 1 => "LEFT_OUTER_JOIN", 2 => "LEFT_SEMI_JOIN", 3 => "RIGHT_OUTER_JOIN", 4 => "FULL_OUTER_JOIN" }
      VALID_VALUES = Set.new([INNER_JOIN, LEFT_OUTER_JOIN, LEFT_SEMI_JOIN, RIGHT_OUTER_JOIN, FULL_OUTER_JOIN]).freeze
    end

    class THdfsFileSplit
      include ::Thrift::Struct, ::Thrift::Struct_Union
      PATH = 1
      OFFSET = 2
      LENGTH = 3
      PARTITION_ID = 4

      FIELDS = {
      PATH => { :type => ::Thrift::Types::STRING, :name => 'path' },
      OFFSET => { :type => ::Thrift::Types::I64, :name => 'offset' },
      LENGTH => { :type => ::Thrift::Types::I64, :name => 'length' },
      PARTITION_ID => { :type => ::Thrift::Types::I64, :name => 'partition_id' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field path is unset!') unless @path
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field offset is unset!') unless @offset
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field length is unset!') unless @length
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field partition_id is unset!') unless @partition_id
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THBaseKeyRange
      include ::Thrift::Struct, ::Thrift::Struct_Union
      STARTKEY = 1
      STOPKEY = 2

      FIELDS = {
      STARTKEY => { :type => ::Thrift::Types::STRING, :name => 'startKey', :optional => true },
      STOPKEY => { :type => ::Thrift::Types::STRING, :name => 'stopKey', :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TScanRange
      include ::Thrift::Struct, ::Thrift::Struct_Union
      HDFS_FILE_SPLIT = 1
      HBASE_KEY_RANGE = 2

      FIELDS = {
      HDFS_FILE_SPLIT => { :type => ::Thrift::Types::STRUCT, :name => 'hdfs_file_split', :class => Impala::Protocol::THdfsFileSplit, :optional => true },
      HBASE_KEY_RANGE => { :type => ::Thrift::Types::STRUCT, :name => 'hbase_key_range', :class => Impala::Protocol::THBaseKeyRange, :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THdfsScanNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TUPLE_ID = 1

      FIELDS = {
      TUPLE_ID => { :type => ::Thrift::Types::I32, :name => 'tuple_id' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field tuple_id is unset!') unless @tuple_id
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THBaseFilter
      include ::Thrift::Struct, ::Thrift::Struct_Union
      FAMILY = 1
      QUALIFIER = 2
      OP_ORDINAL = 3
      FILTER_CONSTANT = 4

      FIELDS = {
      FAMILY => { :type => ::Thrift::Types::STRING, :name => 'family' },
      QUALIFIER => { :type => ::Thrift::Types::STRING, :name => 'qualifier' },
      OP_ORDINAL => { :type => ::Thrift::Types::I32, :name => 'op_ordinal' },
      FILTER_CONSTANT => { :type => ::Thrift::Types::STRING, :name => 'filter_constant' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field family is unset!') unless @family
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field qualifier is unset!') unless @qualifier
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field op_ordinal is unset!') unless @op_ordinal
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field filter_constant is unset!') unless @filter_constant
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THBaseScanNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      TUPLE_ID = 1
      TABLE_NAME = 2
      FILTERS = 3

      FIELDS = {
      TUPLE_ID => { :type => ::Thrift::Types::I32, :name => 'tuple_id' },
      TABLE_NAME => { :type => ::Thrift::Types::STRING, :name => 'table_name' },
      FILTERS => { :type => ::Thrift::Types::LIST, :name => 'filters', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::THBaseFilter }, :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field tuple_id is unset!') unless @tuple_id
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field table_name is unset!') unless @table_name
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TEqJoinCondition
      include ::Thrift::Struct, ::Thrift::Struct_Union
      LEFT = 1
      RIGHT = 2

      FIELDS = {
      LEFT => { :type => ::Thrift::Types::STRUCT, :name => 'left', :class => Impala::Protocol::TExpr },
      RIGHT => { :type => ::Thrift::Types::STRUCT, :name => 'right', :class => Impala::Protocol::TExpr }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field left is unset!') unless @left
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field right is unset!') unless @right
      end

      ::Thrift::Struct.generate_accessors self
    end

    class THashJoinNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      JOIN_OP = 1
      EQ_JOIN_CONJUNCTS = 2
      OTHER_JOIN_CONJUNCTS = 3

      FIELDS = {
      JOIN_OP => { :type => ::Thrift::Types::I32, :name => 'join_op', :enum_class => Impala::Protocol::TJoinOp },
      EQ_JOIN_CONJUNCTS => { :type => ::Thrift::Types::LIST, :name => 'eq_join_conjuncts', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TEqJoinCondition } },
      OTHER_JOIN_CONJUNCTS => { :type => ::Thrift::Types::LIST, :name => 'other_join_conjuncts', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr }, :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field join_op is unset!') unless @join_op
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field eq_join_conjuncts is unset!') unless @eq_join_conjuncts
        unless @join_op.nil? || Impala::Protocol::TJoinOp::VALID_VALUES.include?(@join_op)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field join_op!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TAggregationNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      GROUPING_EXPRS = 1
      AGGREGATE_EXPRS = 2
      AGG_TUPLE_ID = 3
      NEED_FINALIZE = 4

      FIELDS = {
      GROUPING_EXPRS => { :type => ::Thrift::Types::LIST, :name => 'grouping_exprs', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr }, :optional => true },
      AGGREGATE_EXPRS => { :type => ::Thrift::Types::LIST, :name => 'aggregate_exprs', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr } },
      AGG_TUPLE_ID => { :type => ::Thrift::Types::I32, :name => 'agg_tuple_id' },
      NEED_FINALIZE => { :type => ::Thrift::Types::BOOL, :name => 'need_finalize' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field aggregate_exprs is unset!') unless @aggregate_exprs
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field agg_tuple_id is unset!') unless @agg_tuple_id
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field need_finalize is unset!') if @need_finalize.nil?
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TSortNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      ORDERING_EXPRS = 1
      IS_ASC_ORDER = 2
      USE_TOP_N = 3

      FIELDS = {
      ORDERING_EXPRS => { :type => ::Thrift::Types::LIST, :name => 'ordering_exprs', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr } },
      IS_ASC_ORDER => { :type => ::Thrift::Types::LIST, :name => 'is_asc_order', :element => { :type => ::Thrift::Types::BOOL } },
      USE_TOP_N => { :type => ::Thrift::Types::BOOL, :name => 'use_top_n' }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field ordering_exprs is unset!') unless @ordering_exprs
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field is_asc_order is unset!') unless @is_asc_order
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field use_top_n is unset!') if @use_top_n.nil?
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TMergeNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      RESULT_EXPR_LISTS = 1
      CONST_EXPR_LISTS = 2

      FIELDS = {
      RESULT_EXPR_LISTS => { :type => ::Thrift::Types::LIST, :name => 'result_expr_lists', :element => { :type => ::Thrift::Types::LIST, :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr } } },
      CONST_EXPR_LISTS => { :type => ::Thrift::Types::LIST, :name => 'const_expr_lists', :element => { :type => ::Thrift::Types::LIST, :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr } } }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field result_expr_lists is unset!') unless @result_expr_lists
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field const_expr_lists is unset!') unless @const_expr_lists
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TPlanNode
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NODE_ID = 1
      NODE_TYPE = 2
      NUM_CHILDREN = 3
      LIMIT = 4
      ROW_TUPLES = 5
      NULLABLE_TUPLES = 6
      CONJUNCTS = 7
      COMPACT_DATA = 8
      HDFS_SCAN_NODE = 9
      HBASE_SCAN_NODE = 10
      HASH_JOIN_NODE = 11
      AGG_NODE = 12
      SORT_NODE = 13
      MERGE_NODE = 14

      FIELDS = {
      NODE_ID => { :type => ::Thrift::Types::I32, :name => 'node_id' },
      NODE_TYPE => { :type => ::Thrift::Types::I32, :name => 'node_type', :enum_class => Impala::Protocol::TPlanNodeType },
      NUM_CHILDREN => { :type => ::Thrift::Types::I32, :name => 'num_children' },
      LIMIT => { :type => ::Thrift::Types::I64, :name => 'limit' },
      ROW_TUPLES => { :type => ::Thrift::Types::LIST, :name => 'row_tuples', :element => { :type => ::Thrift::Types::I32 } },
      NULLABLE_TUPLES => { :type => ::Thrift::Types::LIST, :name => 'nullable_tuples', :element => { :type => ::Thrift::Types::BOOL } },
      CONJUNCTS => { :type => ::Thrift::Types::LIST, :name => 'conjuncts', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TExpr }, :optional => true },
      COMPACT_DATA => { :type => ::Thrift::Types::BOOL, :name => 'compact_data' },
      HDFS_SCAN_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'hdfs_scan_node', :class => Impala::Protocol::THdfsScanNode, :optional => true },
      HBASE_SCAN_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'hbase_scan_node', :class => Impala::Protocol::THBaseScanNode, :optional => true },
      HASH_JOIN_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'hash_join_node', :class => Impala::Protocol::THashJoinNode, :optional => true },
      AGG_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'agg_node', :class => Impala::Protocol::TAggregationNode, :optional => true },
      SORT_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'sort_node', :class => Impala::Protocol::TSortNode, :optional => true },
      MERGE_NODE => { :type => ::Thrift::Types::STRUCT, :name => 'merge_node', :class => Impala::Protocol::TMergeNode, :optional => true }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field node_id is unset!') unless @node_id
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field node_type is unset!') unless @node_type
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field num_children is unset!') unless @num_children
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field limit is unset!') unless @limit
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field row_tuples is unset!') unless @row_tuples
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field nullable_tuples is unset!') unless @nullable_tuples
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field compact_data is unset!') if @compact_data.nil?
        unless @node_type.nil? || Impala::Protocol::TPlanNodeType::VALID_VALUES.include?(@node_type)
          raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field node_type!')
        end
      end

      ::Thrift::Struct.generate_accessors self
    end

    class TPlan
      include ::Thrift::Struct, ::Thrift::Struct_Union
      NODES = 1

      FIELDS = {
      NODES => { :type => ::Thrift::Types::LIST, :name => 'nodes', :element => { :type => ::Thrift::Types::STRUCT, :class => Impala::Protocol::TPlanNode } }
      }

      def struct_fields; FIELDS; end

      def validate
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field nodes is unset!') unless @nodes
      end

      ::Thrift::Struct.generate_accessors self
    end

  end
end
