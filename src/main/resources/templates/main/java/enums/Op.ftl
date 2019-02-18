package ${gen.enumPackage?replace("/",".")};

/**
 * 操作类型枚举
 */
public enum Op {
    Insert,Remove,Modify,Query,QueryCount,QueryPage;
}